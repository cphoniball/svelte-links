<script context="module">
  let id;

  export function preload(page) {
    id = page.params.id;
  }
</script>

<script>
  import api from "../../services/api";
  import { onMount } from "svelte";

  let linkPage = { name: '' };

  const getLinkPage = async () => {
    linkPage = (await api.get(`/link_pages/${id}`)).data;
  };

  onMount(getLinkPage);
</script>

<style>
  .go-back-link {
    display: inline-block;
    margin-bottom: 10px;
  }
</style>

<a class="go-back-link" href="/">&lt; Go Back</a>
<h2>{linkPage.name}</h2>
