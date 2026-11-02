Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610455;
	b=RTo597RhFJyQ6V6kDWgtrFeOlWy0uLOhyELJW3z2QyUIEq0yRSrhTE/76D/fS3Aa6P07
	 i4xWO4/oSYKv6vYXA4RKwt1DyR9n/wrFWoDazMqH809LICo70JUtO4XBOkfAfw2Tzd9DI
	 nMDiYjNre82TlcMZOzQI8pLySngwhBTTXhhRWknqUOSii8Drdi1Bfub0Lye9rrzXXkSy6
	 61QErxQKqUB/oCbaI+Y5sRCUqeNwwufCfkUJX5dr01fRGXtkxib72BlE4f/DzJJklRKM6
	 +ZNW2ROLUB9QmgpfShxq+aKX0A4ADHc4Fx1IivOK+yOwd4a3El5w/hy5HRBAk2N/Tqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zhSkZK9wUJ7MrrG0jC3AixVJwTfUNHHFD92YhMooG3Q=;
	b=wjUod55nBcPY3OScKfVKRDD4SXtd1Ng3gOXrsCdzhUTdom5tDtnBpI6xAN4ckn3uQ/SL
	 TufIG8fyElu7H7oIc2FLsPYNei7ZVZCPWfQtJKXhlkvbmannrjpnTXWiyjIAFA48hXUdj
	 flLOnVbHpLY86IWvq1yvmiYSdtVChc7pMPALMPrxe++IdJCafz/1nx3HR3Nyt+iV/Vt+/
	 S+VBh5GwwyoLTdw+3EniGDirnUfTRQ8hr27u+TaWLX3+GvPX2EKgqx5fu5JJe8/lkV99d
	 j7E8rCHWcQMxfFOHnrFyzfbuL0VYRtnQWht0Am3gUPWH1wLSfP18/8ciZrfTvQda+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvGqrsvr;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B26606A32D
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2B26606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvGqrsvr
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48c5358fc28so2180285f8f.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610453; x=1794215253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhSkZK9wUJ7MrrG0jC3AixVJwTfUNHHFD92YhMooG3Q=;
        b=uvGqrsvrM1RKd/TWTDMlQdJW4HS+nk+qgSBiEfYhu1pNg9wqWP9uw7LVLnSUk4v65q
         DzSs2CTgCwtUPqodLLo6+/w7sakP2awZZ8lh3MzD3gClIAMmzrW6FpF8UGvfTrxtIOJn
         aF3dyl5GG7wrs0y83lGifYoWs/9rJNzpn/2OLJeOKTKyTkrxAIc9m3o9jmRvnkSTOzmn
         0h3DksKfvDAOM2EHhp2hluF7MpmwvTKQWJtxCipSdj3CNlVUK0kaUntmSAnAxGMM6Npy
         UokLI6TOEj3H+grPgwBOCaCGeXJPuzpa6t/lSs2dCAUHNYAAxDJIX1hpL1UWZGUYafu5
         y3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610453; x=1794215253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhSkZK9wUJ7MrrG0jC3AixVJwTfUNHHFD92YhMooG3Q=;
        b=PNXT1yiz/xBG3FseOI+je7QwvMdE3ow90A8BgzKmgWGCi5hSWstWshmCUsUV/ahbf6
         elIpjnJxNIeb7OWfVeFmhkaRxm0wGZmr9N+TPnPQPmyt818iwuSC5ziJYy4NajX+J7qw
         a+MKZ5llb5GV9Cz6f3mjDcpIqpqBZtmbt78DDDfVPwrIOj9zpVe5pqan/vGqA3nQ/LAR
         yUJOI8SmvDNJ/QJVfiHXAcNARmB9AlS0Ic9QZ3VkWY0IqE5URRc1rsYaWdTj8tZgWjYr
         UyBH5PzjLMnd5uM66f7uUOhFkJyujZMGhpl3IVXB7VHmXKpau+gGncrHxu+oFdp/yxS4
         qXCg==
X-Forwarded-Encrypted: i=1; AKwUvBwxri9jAa/Na7iQSv3YmMTDRY/1vyLUeUde4IV6GBbbQyQGzW+JRUdttUsJ1iFi/kkbcVfi+6khalA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkxkKbJw8dgZzj7NBjvRWQoFxhKyQv1xyJzTI968NlS9UjTesU
	2+Cc5Qd5QOCOYhOj0jdZPuSGh6wr+Mhg6IkkMGne+4X+NgLnF7hi5caG
X-Gm-Gg: AYBFou1r2sQrQu3cromcn3Uk3hEPMijGzrKmqJfzg/e1pxRqWOMCiCasiyRvoSWZcQn
	8w+1A+DXMTVQWLq86Fi26shgBCx4posbdQdRlmWipMx+VZzPBMilvvRKRVtfBTUNZlNNRloTAKF
	KCGw0YeRm1Eg+PeXrvckxLmHPF6dsrBZfhJWPUNFc/xUsvMxKHuXVjO2NtvlX88H+zy6vMAhg3m
	mlNCrObv2X6Un9ISJ01fcUueltrL1TWWQ0q+MzfL7TFzSIPa5bqayLrI635sdsuMtzp8n95ZW3L
	fYItFLPRBXOfMXF6NfaX5P4G+CYaRSu4DkMfMH75WGQk/8hiuMuTXzDdce5IPpdt7bWmUC8H4vU
	Qc6+gQKxb42izN/ag0hFCvm5JdTa2SrTlgdhbeFyCLqMmhntp3PzFqzGyYGKMPUXrWVMrjXTxf3
	AY7JyvbKkaCJ8N0FGVP1d3+cfSS/IgOIdHu1UPB88FZn/zp3IwC90JakIXAE9vg1EmBPtqhmUdE
	XqRLbKHL4nJXfBNwJPtUmF4aRCAzdBgSVUvo4URKSGP4Hnm/OxbMEf4b+7DQ5Ui164tfV/LEEKX
	ORJnD8g7GCEyEAQBXF/G0L8142jOL6oi5EKNdbbrxYliNOJBYpH/YpAkoOFFnnG1mmhLJXwI+Hu
	wdkyjgLv5ABpNTQ/Cqb17vW9svFUnMF9I6zMx/OjoErr+hqfaVeenjMrIrcSjrJ2ydBTnxQydgC
	z/8HqTqk+csgDh
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr216013045e9.26.1793610453395;
        Mon, 02 Nov 2026 01:07:33 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:32 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH 9/9] arm64: dts: broadcom: bcm2712-rpi-5-b: Enable HDMI audio
Date: Mon,  2 Nov 2026 09:06:59 +0000
Message-ID: <20261102090713.896324-10-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102090713.896324-1-pbrobinson@gmail.com>
References: <20261102090713.896324-1-pbrobinson@gmail.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the DMA4 controller, excluding channel 11 which the VPU
firmware uses for VCHIQ, and hook up HDMI audio to it. The D0
stepping uses different DREQ lines for the HDMI controllers.
DREQ numbers and channel mask match Raspberry Pi downstream.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts     |  8 ++++++++
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 10 ++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
index ae4b7c587dbc5..3322862906f62 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
@@ -51,6 +51,14 @@ &pinctrl_aon {
 	reg = <0x7d510700 0x1c>;
 };
 
+&hdmi0 {
+	dmas = <&dma40 12>;
+};
+
+&hdmi1 {
+	dmas = <&dma40 13>;
+};
+
 &uart10 {
 	interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index e5030da60f9e7..3b55840414975 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -117,6 +117,12 @@ &disp_intr {
 	status = "okay";
 };
 
+&dma40 {
+	/* The VPU firmware uses DMA channel 11 for VCHIQ */
+	brcm,dma-channel-mask = <0x07c0>;
+	status = "okay";
+};
+
 &pinctrl {
 	bt_shutdown_default: bt-shutdown-default-state {
 		function = "gpio";
@@ -254,12 +260,16 @@ &hvs {
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 10>;
+	dma-names = "audio-rx";
 	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 17>;
+	dma-names = "audio-rx";
 	status = "okay";
 };
 
-- 
2.56.0

