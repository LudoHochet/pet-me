import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Pet me", "i'm famous"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
