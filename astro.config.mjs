// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	site: 'https://quick-site-handbook.pages.dev/',
	base: '/quick-site-handbook',
	integrations: [
		starlight({
			title: 'Quick Site Handbook',
			logo: {
				src: './src/assets/houston.webp',
			},
			social: [
				{ icon: 'github', label: 'GitHub', href: 'https://github.com/arthursw/quick-site-handbook' },
			],
			locales: {
				root: {
					label: 'English',
					lang: 'en',
				},
				fr: {
					label: 'Français',
					lang: 'fr',
				},
			},
			sidebar: [
				{
					label: 'Quickstart',
					translations: {
						fr: 'Démarrage Rapide',
					},
					link: '/quickstart',
				},
				{
					label: 'Intermediate',
					translations: {
						fr: 'Intermédiaire',
					},
					link: '/intermediate',
				},
				{
					label: 'Command Generator',
					translations: {
						fr: 'Générateur de Commandes',
					},
					link: '/command-generator',
				},
				{
					label: 'Manual Guide',
					translations: {
						fr: 'Guide Manuel',
					},
					link: '/manual',
				},
			],
		}),
	],
});
