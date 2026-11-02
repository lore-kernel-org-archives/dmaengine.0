Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610452;
	b=LsfOhZ2XUCSQWnVcna2Uf6B8L0QB+BYu9C0V4yJuwfrnX+4mE5N6trsoPfTaReEkqZkJ
	 yozYzMFhp/BArz82B7nUMz3y2mMx81j80LH2jTbS9ZvdvEZ0jhymJ5L75iCJ/eN9faufO
	 cq1jw6YA6XSpC5YRecNE8+9u3df1Ahrp4KtxNTmDCd2KNl5iLvAkV0lC569Dym5/d78Db
	 2p6gzbPIPfQDDVdKcPMh4KzdphD/yyKvs+K28YeUbWkdRKeb7Tr2TTgTXT3OwfgzAK8hN
	 p9w4/SqACJSfeaxKtqUjlysk7zj3mHsmeRvrG/DIkBsDua6a7Z1iv7uCgssIhz8u7aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
	b=n4YiEDZhiFspqCs+/VCkZg1RRotTckqWRQtpjxQKxiKrJV25mNzbiSNU3Io/mag+Yxi4
	 0c5JklikpyJdpaigj/Tcqj7KJ+Oyik8oK+Vk71UI+yCznjIX7tJSUCuthhRkeAa7t+bnm
	 WDbLdqGBiyM9DFNfsuaor/zkBeyMDuOKLFubhEaeGVum2CupoN+eMqlkeWd0O86Zitf8B
	 g0v7AcVQF1ixTbQXvCdfIKwMUw0VOtNzWf8uaO1L/pbjVhhFvPhe8H6+Hhx/qLHPIiBV2
	 ITvjDAer6HAdTrJzOYpGK7PJS+YAgj0wGkAKLMQk+oxkQ41bQbUtbaI8TVMMmbE3aWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+5SqkAK;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098B3606A324
	for <dmaengine@vger.kernel.org>; Mon,  2 Nov 2026 09:07:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098B3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g+5SqkAK
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so17781745e9.0
        for <dmaengine@vger.kernel.org>; Mon, 02 Nov 2026 01:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610450; x=1794215250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
        b=g+5SqkAK2Lw6nb1DAvrw0aUpPuXaqrN4EVqrLvgEt8tECV4HZNwk+o82weuVlS+zK6
         smd+vs2aGipLC5ckbzeRJB5zM7iLDUoKx5EBXnjL8gnAjeRI9IgKplqTB7usq7tY6O4V
         ccX1fu/ORXfXVtCOtiIQuRB1ZkDCccWhCseawvcQ5gS2+pr54e9KiPQLu0RTW6i9ABp6
         RFFw7+mgR2+m6kkJ/cGJBdCbRStpvFDI5B3UpGCtC+KQxW8MlEMF33FLcGrcOUWwqewC
         +lA3ICUvajFe6lSIYgacEEO/GzRwWLG+ZRbocPTifUmgJYduOJIU1fW7drlHHJdk6y2s
         ZWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610450; x=1794215250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OWa6rCe3eYZYo8piCwJXbY132UwyBp1v43wGP7zJqDE=;
        b=mNy2kmsWlVar6SAEjJic1nZ3ZcR8Vv7jtVK6c/TFOnN/qbdum4jG+OSwXR21D79ETt
         FCui/3i8jFCigf7sgkgK2Oi3n+iSdpGZkWUr3PrXP1fwe0SDhdpWZlV8Elz+CkLPueVC
         ZjBxLLxCQG8s5VYz/QV3ewi84ncrGZpHIO0RYzQtpSrYU6iGzTfJvcq9NLyLTQHdTYtL
         V9qKy7PqJ5IWIXV/pmOH/lFFUT1dXbr5LWGTvG1GxlKEYTRaOVr+nrOh3hL1ULed1g5v
         Tq+VomiLdooZtJgyRSGa4tvxrbpGKdSebPE3Vq81yxN46vUPy+rzxI4QfGv/baNdySyq
         sc8A==
X-Forwarded-Encrypted: i=1; AKwUvBw8mCXjPJHi8wwbGeEGNe1rNpCfcqfdpLz/RDXKJQkvftTtEoS72qBoZgMlu8TQ4oUmh5YX7+nlu+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxUWyPA2WOlv52012VON3rMu/j+9RwTk4b0Xc0LmNupDYRlXcG
	3z5wvk7MrdBTPlIhQfM3H6HN1B6HWWM6J8n1/qrxmCSIgq1WPkHEsKh9
X-Gm-Gg: AYBFou2mxZ7AURRPyreaH7a6q6hp0NRDvJOGhZLvHASYlTNAsSKrn9PTNmnfYQjxOhY
	MAy/X4QVuUIVsapn9pEKUIiZ7+tIFDLeG1NhsqWKMwY86Rk0JWi6SUCagAiJoKEuN4RWk83npxY
	HfQ610WK5mlFMWZU11v7wZeYCEmLsKLZviU+KrGwvsWrqti9qoePQW0DGl3REw5O7TWu0ahdarf
	gYbbdLakE0WGoX8J3etArsyHPdBmaXshleEwEHbJFMIq3d9Ri8bdVrH7bEGVBIhICHLyBUQdZ2N
	u/XSfGqX4I3OpZCoy3TW8Q6ELcHsnXUlRyMUylml7sAzN/WA5MjsknCnK2JAeRYjTZxAXJ2DlZ2
	L227VRwt7NH8wKbrh5XcFZfnaVab9ppyJ1hXG8pnPUtSG2FYpnWD11eaAz7ZWiF7EsevBF9pXE6
	7I+HMwwTDIWyMRxak66I/b/gS8QBstuErK/WK/mLkxtHf1/tGYWbL2f+bJVBkUbdujmXahl8zYA
	jGmPxlw77hPVZ6h7F2ExJGNb1Igv0nUwrD54JJloBfOeseA5kp/cRg5S6fSt2E7zWYP683mqs3t
	TmN7mOyMkskNaLq9njbKwKKqOGf451OCM1o5oIiO9RGS0jcOMcbRVHwlvPwdDVpykOiSvUzxH0F
	Vb8P0F3WtiFW3T+S+3pYf0eGEsmDx+JEa7RjveWS3Y+6n94OcLI/nIvs/zXqzVHcTR94ptL7D6N
	ldLZWWGaLRrYep
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr192107805e9.29.1793610450362;
        Mon, 02 Nov 2026 01:07:30 -0800 (PST)
Received: from cypher.home.roving-it.com ([2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abf5b27e46sm417879945e9.3.2026.11.02.01.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:07:29 -0800 (PST)
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
Subject: [PATCH 7/9] ARM: dts: bcm2711-rpi: Use 40-bit DMA for HDMI audio
Date: Mon,  2 Nov 2026 09:06:57 +0000
Message-ID: <20261102090713.896324-8-pbrobinson@gmail.com>
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

Enable the dma40 controller on the Raspberry Pi 4, ch 11
is reserved for the VPU firmware for VCHIQ communication,
and add the DMA channels for HDMI audio.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
index 1eb6406449d19..a49a732d3f64e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
@@ -42,6 +42,12 @@ i2c0_1: i2c@1 {
 	};
 };
 
+&dma40 {
+	/* The VPU firmware uses DMA channel 11 for VCHIQ */
+	brcm,dma-channel-mask = <0x7000>;
+	status = "okay";
+};
+
 &firmware {
 	expgpio: gpio {
 		compatible = "raspberrypi,firmware-gpio";
@@ -59,12 +65,14 @@ reset: reset {
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 10>;
 	wifi-2.4ghz-coexistence;
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	dmas = <&dma40 17>;
 	wifi-2.4ghz-coexistence;
 };
 
-- 
2.56.0

