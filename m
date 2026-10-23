Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780966;
	b=p5WwaqY6gNdipTfagaEjkqio509lH6vi2qCj7Zmjun5CgAsYOEhIoj7kkAxWj/jlLjQk
	 kjBpz9LeWLrVRd4OVBMAy68n165xSMmSFtsetaDcNC5lx9G5SCA8W+5KvHZ+8z51mqkAY
	 /waDgRLHOdItRU8QQ15+jVNKHM0CNmc7g78EJ8Ho981r1/F08Iqq6ogw8eeBeFIZboaGz
	 W6VDy6m7l/LU+7OBVigKECRS2tBIL5G4DTkcM+wnnHZ83s7aBtUQUJuLrtfLb0+x2y2N/
	 XfqHZ084BW16iJthFXXUrs7Tmr/YBiuBwkM7BUWD8GozyfzPuENyFMsTkm1p2o6Tetg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
	b=d6ywdUxNOrfeRLOudy+wu4qf6dT2Ai4CJVY/WCVZRT1OHannN81H6T4rOMd0JRX/fdUf
	 7dgd9aPqcngCF1Xaz14BlrmLyOr6l2Q+sos0AZXdO9bZIbLB4YpVDr5N3jrPW36kylkYq
	 UjrotrqjxaeP5s8lBppBdbwjnnV7chL8SFIVe9uM9O9NDpc4cOR0lvdVNmRBVxEp1bpVf
	 Q4u0aRk/eJDHCDhal8Dc8MNNurdV0JlmtXFhTcagYCd8Lhf4AQA3x3pgVF3KYPyxY+xeI
	 5mvvk0MqyGQg8myochluZ4zDr91ucSYt2dGIlVZl8uGQz4tBWYOqP5EH9xXTOy4tWzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGHX5hu;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8E9606A334
	for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 18:42:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F8E9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SLGHX5hu
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8256106635eso619653a34.0
        for <dmaengine@vger.kernel.org>; Fri, 23 Oct 2026 11:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780965; x=1793385765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=SLGHX5huiodZlkNq99J51FiOKv4XM9q9Xs0bDua0NtQlic9V5QXI4qE2XMSNOBPJx9
         1quJqfbceKvueqHiPAn1D5b/NZrAPzwp7oxvBw+AO+Enmia1OJeTBbl9a4F1qA2BCFxV
         yvCXLMl7GSV7ESByNrpHN8EFuFDauut2YsNzYoufCL4ViCbIE7zjLMe4bzeWcULIrnde
         6Uyk+JGtoL20FvIG8F1ltoJMlSTXO/lBKMwb3DyxlwFurfB4gNvzM9gqqwyAn6N6YF/9
         pC09r1g16TnEIRtCrG4Exl0weDRxoHR6f0jwj1XrSErOBBprwIytHhdRcSntmj/mqw3/
         aUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780965; x=1793385765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4PRNLWENu8KTspo6tzX21p33JWmvMwO8+MOa0PXQoA=;
        b=ZeE2B0pBZ/Lmqv121Xyp3IPxCyHY/2GnB8VQ/tOW8gwnCO4Jx+TnQdR8GlGQjUpIwA
         AmMxNxwGR7WfJkl7Tt2tMka/wPMsnPD3S70tnJ+uc1zk/0ePPwHLH580tOV0eAz7oYkg
         PrRsyoKo3V0eCnNRKTYk27HQZawd8+jlsGjzRa2euG5WELFo7E3oYxcBjCwW6ajN4rS/
         cwYMi1TO3Dd7d5xFG3itcvluCiGT7DjUZTS8QqYjj/nmW4TVADIiVoQ0VNNLS5XXtIVU
         fGWFIeAoCeGI9y99/fQJIBzDtG/XLb3zMUYs1cVp3InSSFmycB6O+rzKs4CHzUArcM77
         CDNw==
X-Forwarded-Encrypted: i=1; AKwUvBwhYBYUdgzGjj76hrq7CGCwWlKrEgeXG4xP/zNMzWdY+lFvwlYUdoApAjLN3O6ShlUditOzaPITf+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJu6G8E22qRaqHO+avJZtYFa8NkbtswUPkcOZMEEL4LYIFVtD14
	lu/oR8lH1sq0rrK6gcvFwuytsVXYA2xoI0qC/yxOeMrQD+FNfr4F3N7V
X-Gm-Gg: AYBFou2gMjpvWMrvOUlsvabniBpu2F527mmB2s/khr1dyZUTXnhED2yxAIBK9EvLAFt
	2JJiR9QImZC3CqTSaBkLzI9dsrafG935/qVToYEx3UW8b6LLlxha5GDfV+nPNqnHoRohuW9HFBL
	vbRHDzhHAVsRiaYZv8N3MEcUp8UjBqI55z/X4Mb1WZR2CZi2UA9tuExjR2N46/X6NxoZARt8S7N
	tnoN92cbprMa+sNmP7bVGo5cgn1NOg0qRUfX57CrYijoaX5kzJP9of7pJyObz8i4LA+Xtp0s8Mm
	4BE09ybE8Upb+YGo6Tx5gQJyNDVxne6PRVLkJ2VhWJTuhXqz8RkTnICduYFbP9VtiwJDS4xVm6h
	qf9B3bb5YJpUR1FdEL4F5L041CsGsUD+9X6h9fdS4sgaBANhlIKbiZRvufuTTc/zub8f2PO9K5F
	jPB3Emtz9hhNyp4E7o31g1EUw4Qbnv+xxSzPoS5HDiFmehBkNCRxvm7W7qtslM91XZOzkHX9N/c
	6JWV3ldpWe9X2ha85T+SnybqUd3uIvoSWDkynkqOIV0QCeu5LS2ao66WOFkY9EjD4PMa3/Vxo9q
	TgCZkuG1VMU2vLJaoTIGzmtHCXoBc0vJXHapkDOBjxnvpZtlJB258ia58pzMoDG8uUjKDPiw2U6
	ZbSrjzcQz4X374SvYODBntxSiZmvlMZ9zUaVTVhsF13fA/WhDyXQJgIBdo6HLQDGQH8tFcT/5Hf
	88qA==
X-Received: by 2002:a05:6808:1819:b0:539:596f:6623 with SMTP id 5614622812f47-55c0035e613mr53516b6e.64.1792780965312;
        Fri, 23 Oct 2026 11:42:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:36 -0600
Subject: [PATCH v2 2/6] dmaengine: sun6i: handle the last partial interrupt
 bank
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-2-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9d94a37fcf10..0a9645171180 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -587,12 +587,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -602,8 +603,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans && status; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0

