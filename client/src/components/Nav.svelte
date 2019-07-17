<script>
  import { onDestroy } from "svelte";
  import { auth } from "../stores/auth";

  export let segment;

  let isAuthenticated = null;

  const unsubscribe = auth.subscribe(
    authState => (isAuthenticated = authState.isAuthenticated)
  );

  onDestroy(unsubscribe);
</script>

<style>
  nav {
    border-bottom: 1px solid rgba(255, 62, 0, 0.1);
    font-weight: 300;
    padding: 0 1em;
  }

  ul {
    margin: 0;
    padding: 0;
  }

  /* clearfix */
  ul::after {
    content: "";
    display: block;
    clear: both;
  }

  li {
    display: block;
    float: left;
  }

  .selected {
    position: relative;
    display: inline-block;
  }

  .selected::after {
    position: absolute;
    content: "";
    width: calc(100% - 1em);
    height: 2px;
    background-color: rgb(255, 62, 0);
    display: block;
    bottom: -1px;
  }

  a {
    text-decoration: none;
    padding: 1em 0.5em;
    display: block;
  }
</style>

<nav>
  <ul>
    <li>
      <a class={segment === undefined ? 'selected' : ''} href=".">home</a>
    </li>

    {#if !isAuthenticated}
      <li>
        <a class={segment === 'register' ? 'selected' : ''} href="register">
          register
        </a>
      </li>
      <li>
        <a class={segment === 'login' ? 'selected' : ''} href="login">login</a>
      </li>
    {:else}
      <li>
        <a class={segment === 'logout' ? 'selected' : ''} href="logout">
          logout
        </a>
      </li>
    {/if}
  </ul>
</nav>
