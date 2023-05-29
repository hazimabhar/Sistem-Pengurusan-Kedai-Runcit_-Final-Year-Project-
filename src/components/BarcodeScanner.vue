<template>
    <div class="section">
        <div id="qr-code-full-region"></div>
    </div>
</template>

<script>
import { Html5QrcodeScanner } from "html5-qrcode";

export default {
    props: {
        qrbox: Number,
        fps: Number,
    },
    data() {
        return {
            result: "",
        };
    },
    mounted() {
        const $this = this;
        const config = { fps: this.fps ? this.fps : 10 };
        if (this.qrbox) {
            config.qrbox = this.qrbox;
        }

        function onScanSuccess(decodedText, decodedResult) {
            $this.result = decodedText;
            $this.$emit("scan-success", decodedText);
        }

        const html5QrcodeScanner = new Html5QrcodeScanner(
            "qr-code-full-region",
            config
        );
        html5QrcodeScanner.render(onScanSuccess);
    },
};
</script>