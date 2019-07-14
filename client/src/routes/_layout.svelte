<script>
	import { onMount } from 'svelte';
	import Nav from '../components/Nav.svelte';
	import { auth } from '../stores/auth';

	export let segment;

	onMount(auth.getUserData);
</script>

<style>
	main {
		position: relative;
		max-width: 56em;
		background-color: white;
		padding: 2em;
		margin: 0 auto;
		box-sizing: border-box;
	}
</style>

<Nav {segment}/>

<main>
	<slot></slot>
</main>
