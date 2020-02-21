import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Pet me, I'm famous"],
    typeSpeed: 70,
    loop: false
  });
}

export { loadDynamicBannerText };
