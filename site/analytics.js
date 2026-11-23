/* Sheaf website analytics: Google Analytics 4, loaded ONLY after the visitor says yes.
   Nothing loads and nothing is stored before that. The Sheaf app itself has no analytics. */
(function () {
  var GA_ID = 'G-PH18YY2P4F';
  var KEY = 'sheaf-analytics-consent';
  window.dataLayer = window.dataLayer || [];
  function gtag() { dataLayer.push(arguments); }

  function read() { try { return localStorage.getItem(KEY); } catch (e) { return null; } }
  function write(v) { try { localStorage.setItem(KEY, v); } catch (e) {} }

  function load() {
    if (window.__sheafGTM) return; window.__sheafGTM = true;
    gtag('consent', 'default', { ad_storage: 'denied', ad_user_data: 'denied', ad_personalization: 'denied', analytics_storage: 'granted' });
    var t = document.createElement('script'); t.async = true;
    t.src = 'https://www.googletagmanager.com/gtag/js?id=' + GA_ID;
    document.head.appendChild(t);
    gtag('js', new Date());
    gtag('config', GA_ID, { allow_google_signals: false, allow_ad_personalization_signals: false });
    // Which link was pressed: the download button is what matters.
    document.addEventListener('click', function (e) {
      var a = e.target.closest && e.target.closest('a[href]'); if (!a) return;
      var href = a.getAttribute('href') || '';
      if (href.indexOf('/releases') > -1 || /\.dmg(\?|$)/.test(href)) gtag('event', 'download_click', { link_url: href });
      else if (href.indexOf('github.com/NegiAkash890/sheaf') > -1) gtag('event', 'github_click', { link_url: href });
    });
  }

  function banner() {
    var b = document.createElement('div');
    b.setAttribute('role', 'dialog'); b.setAttribute('aria-label', 'Analytics choice');
    b.style.cssText = 'position:fixed;left:16px;right:16px;bottom:16px;max-width:560px;margin:0 auto;z-index:9999;background:#1f2a24;color:#fff;border-radius:14px;padding:14px 16px;font:14px/1.45 -apple-system,system-ui,sans-serif;box-shadow:0 8px 30px rgba(0,0,0,.25);display:flex;gap:12px;align-items:center;flex-wrap:wrap';
    b.innerHTML = '<span style="flex:1 1 260px">Can this website count visits with Google Analytics? The Sheaf app itself never sends anything. <a href="/privacy.html" style="color:#bfe3cf">Details</a></span>';
    function btn(label, primary, v) {
      var x = document.createElement('button'); x.textContent = label;
      x.style.cssText = 'cursor:pointer;border:0;border-radius:9px;padding:8px 14px;font:inherit;font-weight:600;' + (primary ? 'background:#7fc8a0;color:#10261a' : 'background:rgba(255,255,255,.14);color:#fff');
      x.onclick = function () { write(v); b.remove(); if (v === 'yes') load(); };
      return x;
    }
    b.appendChild(btn('No thanks', false, 'no')); b.appendChild(btn('Yes, count me', true, 'yes'));
    document.body.appendChild(b);
  }

  var c = read();
  if (c === 'yes') load();
  else if (c !== 'no') { if (document.body) banner(); else document.addEventListener('DOMContentLoaded', banner); }
})();
