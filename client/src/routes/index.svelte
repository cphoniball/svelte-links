<script>
  import { auth } from "../stores/auth";
  import { onDestroy, onMount } from "svelte";

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
    const response = await fetch("http://localhost:4000/link_pages", {
      method: "get",
      headers: {
        Authorization: `Bearer ${localStorage.getItem("token")}`
      }
    });

    linkPages = await response.json();
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
            <button class="btn btn-primary">View</button>
            <button class="btn btn-danger">Delete</button>
          </span>
        </li>
      {/each}
    </ul>
  </div>
{/if}
