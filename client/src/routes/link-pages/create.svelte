<script>
  import { goto } from "@sapper/app";
  import api from "../../services/api";

  import Input from "../../components/form/Input.svelte";

  let name = '';

  const createLinkPage = async () => {
    const token = await api.post("/link_pages", { name });

    // TODO: Check for error and show error message if we couldn't create for whatever reason
    goto("/");
  };
</script>

<h2>Create Link Page</h2>
<form on:submit|preventDefault={createLinkPage}>
  <Input bind:value={name} value={name} label="Name" name="name" />
  <button type="submit" class="btn btn-primary">Create Link Page</button>
</form>
