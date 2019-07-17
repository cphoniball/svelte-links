<script>
  import { auth } from "../stores/auth";
  import { onDestroy, onMount } from "svelte";
  import api from "../services/api";

  let isAuthenticated = null;
  let userData = null;
  let hasFetched = false;
  let linkPages = [];

  const unsubscribe = auth.subscribe(authState => {
    hasFetched = authState.hasFetched;
    isAuthenticated = authState.isAuthenticated;
    userData = authState.userData;
  });

  const getLinkPages = async () => {
    linkPages = (await api.get("/link_pages")).data;
  };

  onMount(getLinkPages);
  onDestroy(unsubscribe);
</script>

<style>
  .link-pages {
    list-style-type: none;
    padding-left: 0;
    margin: 20px 0;
  }

  .link-page {
    display: flex;
  }
</style>

<svelte:head>
  <title>Link Pages</title>
</svelte:head>

{#if hasFetched && !isAuthenticated}
  <h2>Welcome to Link Pages</h2>
  <a href="/register">Click here to create an account</a>
{:else if hasFetched}
  <h2>Welcome to Link Pages {userData.username}</h2>

  <div class="row">
    <a href="/link-pages/create" class="btn btn-primary float-right">
      Create Link Page
    </a>
  </div>

  <div class="row">
    <ul class="link-pages flex-fill">
      {#each linkPages as linkPage}
        <li class="link-page border p-3 mb-1 flex justify-content-between">
          <span>{linkPage.name}</span>
          <span class="buttons">
            <a href="/link-pages/{linkPage.id}" class="btn btn-primary">View</a>
            <button class="btn btn-danger">Delete</button>
          </span>
        </li>
      {/each}
    </ul>
  </div>
{/if}
