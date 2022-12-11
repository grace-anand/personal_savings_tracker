// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  css: [
    "primevue/resources/themes/saga-blue/theme.css",
    "primevue/resources/primevue.css",
    "primeicons/primeicons.css",
    "~/src/assets/css/main.css",
  ],
  build: {
    transpile: ["primevue"],
  },

  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
});
