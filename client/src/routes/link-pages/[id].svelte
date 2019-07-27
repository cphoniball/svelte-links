<script context="module">
  let id;

  export function preload(page) {
    id = page.params.id;
  }
</script>

<script>
  import api from "../../services/api";
  import { onMount } from "svelte";
  import Input from '../../components/form/Input.svelte';

  let linkPage = { name: '' };
  let link = { title: '', url: '' };
  let links = [];

  const getLinkPage = async () => {
    linkPage = (await api.get(`/link_pages/${id}`)).data;
  };

  const getLinks = async () => {
    links = (await api.get(`/link_pages/${id}/links`)).data;
    console.log(links);
  };

  const createLink = async () => {
    const createdLink = (await api.post('/links', { ...link, link_page_id: linkPage.id })).data;
    if (createdLink) links = [...links, createdLink];
    link = { title: '', url: '' };
    document.querySelector('#link-title').focus();
  };

  onMount(getLinkPage);
  onMount(getLinks);
</script>

<style>
  .go-back-link {
    display: inline-block;
    margin-bottom: 10px;
  }
</style>

<a class="go-back-link" href="/">&lt; Go Back</a>
<h2>{linkPage.name}</h2>

<form on:submit|preventDefault={createLink}>
  <h3>Create New Link</h3>
  <Input bind:value={link.title} value={link.title} label="Title" name="title" id="link-title" />
  <Input bind:value={link.url} value={link.url} label="URL" name="url" />
  <button class="btn btn-primary" type="submit">Create Link</button>
</form>

{#if links.length}
  <div>
    <h3>Links</h3>
    <ul class="links">
      {#each links as link}
        <li><a href={link.url}><strong>{link.title}</strong>: {link.url}</a></li>
      {/each}
    </ul>
  </div>
{/if}
