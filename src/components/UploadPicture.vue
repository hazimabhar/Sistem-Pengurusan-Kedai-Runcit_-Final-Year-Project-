<script setup>
import * as LR from "@uploadcare/blocks";
import { onMounted } from "vue";

LR.registerBlocks(LR);

onMounted(() => {
    document.documentElement.style.setProperty(
        "--public-key",
        import.meta.env.VITE_PUBLIC_KEY_UPLOADCARE
    );
});
</script>

<template>
  
        <lr-file-uploader-regular
        css-src="https://esm.sh/@uploadcare/blocks@0.22.9/web/file-uploader-regular.min.css"
        ctx-name="my-uploader"
        class="my-config"
    >
    <lr-data-output
                @lr-data-output="$emit('upload')"
                use-event
                hidden
                class="my-config"
            ></lr-data-output>
    </lr-file-uploader-regular>

</template>
<style>
.my-config {
  all: unset;
  --cfg-pubkey: "bbbf2eed558010dd8d9a";
  --cfg-img-only: 0;
  --cfg-multiple: 1;
  --cfg-max-local-file-size-bytes: 10485760;
  --cfg-use-cloud-image-editor: 1;
  --cfg-source-list: "local, url, camera, dropbox";
  --darkmode: 0;
  --h-accent: 223;
  --s-accent: 100%;
  --l-accent: 61%;

}
</style>