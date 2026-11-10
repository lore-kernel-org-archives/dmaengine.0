Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794272717;
	b=NxlbT6ZDi6ys2v/4qd9hzB9e21C0tk3yc7jcpV8iSBCyOptDQuxS4Iy7St4IbIHoXa1B
	 SGDfOGb5NiPk4REIrU6mnYlXwUx3LmffwagQnkt/ZUSypHX+lEzG2lOAMNFzMYAP7NGeu
	 UUDFNCpqXjaQgdjEjA5DaVYJxQa2qWKq1VZYYmjLHlrAx75razwFAr1jndWZ0u9eG170D
	 PToLk3XCqgE/ZW/1bpHNILOE20qrhZ9rrZ2rgm/Yir7axeIiSK2SOAr/LStKxzlK7fWoR
	 OTsP+oNGc63WX8QvO3urWUYyfhHlOF+i8Tul1Or+J7UNmGwLr7liIC7+JjPybJ6qDDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794272717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
	b=IlSxcIhNu7cGuMBEts1HgXHfrZeC1grf8nPK8KElZ+s+WeLKib6QHd+XVl4qSEY7joTD
	 gGEROuTSk7K6LqKCUKNrFvsOVXLkBOJQBAWlhxyXEK1Bpcfcq+vYys1ko729YLRmAiZrX
	 EK6QMzXflWbv3wWlrUQjvzZ8vYug50OcrTEp0EreOqLIPopT9u1sBBGf8lESAsHxyZhYw
	 DEVR0540VjVpwEvYCmtRUI/UzkBhIAyANvfkoUzVKHuJZW61En012+gubpRvKRgRZUa0n
	 dbiHrbUYwk0TYbkHNKuNfKBKodBJxxVZDRerZ36Xc/zhWFRdPyu9mswKym34hF+xGEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJwzvLlW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A09606A325
	for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 01:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A09606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJwzvLlW
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c49b431f022so248626066b.1
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 17:05:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794272715; cv=none;
        d=google.com; s=arc-20260327;
        b=m8Fzl3GE6HVF2c9Qx/bW7W/xMuruSynBktBY1mrCGNDhKjkebdhodN/Jvi0Ikr4x8o
         OtyMqNcJvJc/0WOUOrTaoq3SN+F9tJt/oCFcV/naUHUY4RIOn8pqvfOSIw2/p65JXp45
         Rl7Z0hutT9Kifvp/UQSNElfT9jWkxpbnZSFUnWTsypv9DEv1Zrovus17Yj6i2U52wEoP
         gmRrNGOZepGCdyt8cQ+Nk9TZsOIOS2OWJ2vQhhDjDdc5ndyW1G/x0+VM3LbxC7gEQApE
         Y1oZVsVs+/rQEVOzf4RbCTesRsSBrvZEJZBE2UWAuy5LcwtLJBy9+l3KDdLduuFs7JFz
         0YMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        fh=ev6EjY/mHonTyiFRb3x43HxXjQotnk4fQ21RKyeI2xE=;
        b=JFY2rUPo6Dh4OSBvT546nw7PTc8T65A+ZOpfPxrhipjdVa8ppHFHbNfZj/aWvjVNFV
         HlUdfxkvpUJJP5bxCCBXqaYng6RvIWFy6pEbko2wt0747D5SPP+m3EqZVrmsuY+jedBb
         DEZfcOkZYOMN4Uv5P8icKZM1pvLtEoPjNcotfxAFWa1WqeSKKktCKDclpEvLa3gt39uP
         qOWKhVf+Bb9HglljYVLLAuaFcMZG9Adookfp3EX7aQjvxIMQVXNNdQUdVRIGijNhFyTd
         +O2S4yom0/KvwUMIG5Ov1sNOAhFl20UszZ9Sfdkd/ZXR2oUDE/hXlSybOkVpKNJST9z8
         nr5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794272715; x=1794877515; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        b=EJwzvLlWemAiJQlLcbFXjIDIOWSoLnPY+Ti1smD3aW/8aAMzZbilo1xHCy2qFOg0zY
         5+PMEZqAdDj/1YZI7O2vKTc6Ya8JbcTgJalkPeZJ0rkhP/IY9DlaTA84cOc8xJpm3cgb
         9jTqXOT3gpWxJqii2i7vJPRaPlsnNF2n+Fdq7EUnpODEAVhsB8i7hJh25PGn3dtdf6IT
         VWJ6sBdsZ92KLRG20BDYngVk7S3y8hKMsjWKGq+7zpLOar+huX1pSM2VyfM+5cf4vs9n
         p8IIohiC10J3uzDMexHMmvKwJ+0Njk4mLyOky5H5r8ZsH0lvpjPedTYwu5GdzKTvNPOV
         8z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272715; x=1794877515;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MthmOJfnDDMnFbUTMe+FDaMFE08/drUE13fKZFvJlh4=;
        b=wkzFwyUZwKfpAZmoz3XotjiCEwbaU9AWDc3F+OvKxeEnTCosyTCDXo+1k6pi9HPV2w
         7zLjMNmD6IvtwK+pofvxpRGlQfcmdcy4+pd8TLKY3rVd7JwJndBUuEWQK5hFaP1C7Ah/
         0SXGP45SWwOrF0aFm+4CtRPbZUT5qaw3BtK8C1XTUa324IXmg+9aKOAzG8p/YpWYwGEy
         3gbcomuIwiqV6yRJ06oVK7QMmpfyprLnL5kRCmhH9KWeNtsmAZnI9T8olKy9WxHvPiD+
         rBz8LTJ3pkUtleepyxvhVQCBU/ApC+OAW9+nPKOwgZebmYpt6Y1zc/RFgcfNi0ArP830
         ruNw==
X-Forwarded-Encrypted: i=1; AL+hErFmOWP0JufpBCB0Qsq2JmZrXogX+6uPD8rPipUJ1icQxD1yylwmxZHPlzXpDOaZe2MANqKHkyXJ6io=@vger.kernel.org
X-Gm-Message-State: APuU4Z83O4LqBeVaEOsxUMGr/E7aW7LlTWyoRCZqLrZDd7NOsmM3yBU0
	ITy4zhlkRK/MRuNGtembP8q+Kch8SGO5dowQ4vsvnDglqrXPKzW+DpIlKuDBSiOygDBuNsvKjB3
	UVK3WTIHAxLNb3C8UpKKVNuzcMREb5Q==
X-Gm-Gg: AYBFou1hk3EldzvgNPHffLmdRZPdNAj3JuZxl3EFcRoKM2tWu/7xS4Cte5x1/IhI1Ft
	JTIDZV6YOUpp7pYSzTGR8gMYUvVgWjdf35naPrOM0ZtJlnzHON4ttNg+O0MoPjkBK+3nLqvoX3F
	y/OCVY1Jg6Cq2FMHiWaSxczNVqWRNmjpso0vqdTJRSAVg6EBQtRePHBhD1sFKLDyyPIkPJjcYPr
	AqD+mWhg1R/FOsD6JwX2DN5aW0IZ4rNZcWmyrHXCyyBNdjtA87xSWBsFlaCIZGxZW/93xgClVac
	iLDzMKKAcE8kz9vkOfvvYhHfexE16blMwMueH3K14HQYfFBIhnNKESX15zVrsTkSHitdAu0i4Ht
	O+FgH2I2L5hKEUuh2hUOrV4lehozVncMvi0yk6dz1Tu9Sc+QE85i+cYSxvBkVirw8U7HN9moA7+
	cb9Q6MRY5+dJVzXS+9NKZ03mli88TKfIOLf0YQc9X/wf8=
X-Received: by 2002:a17:907:daa:b0:c4c:c997:8711 with SMTP id
 a640c23a62f3a-c50495fe4demr79667466b.38.1794272715279; Mon, 09 Nov 2026
 17:05:15 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 01:05:14 +0000
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 9 Nov 2026 19:04:55 -0600
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 10 Nov 2026 01:04:45 +0000
From: Myeonghun Pak <mhun512@gmail.com>
In-Reply-To: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
References: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Date: Tue, 10 Nov 2026 01:05:14 +0000
X-Gm-Features: AclHuK-Tz10TtmmbetQzQohzCKMVdVOkQRARraFioJZyzZB0RQCUaNN_wDp_oLE
Message-ID: <CAGEsz8Hrng-rnKE8hVKUo0RZD484HuSUGc5rWWeGNa6JsdaKoA@mail.gmail.com>
Subject: [PATCH v2 2/2] dmaengine: stm32-dma3: defer clock cleanup to managed teardown
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

Probe enables the controller clock, but remove only disables runtime PM.
Disabling runtime PM does not invoke runtime suspend, so removal of an
active controller leaves its clock prepare and enable references held.
Probe error paths also disable the clock before managed DMA registration
and IRQ resources have been released.

Register a clock cleanup action before acquiring those managed resources.
Keep the existing remove-time runtime PM disable barrier, and let devres
release the remaining clock reference after the DMA and IRQ resources.
Skip the clock disable if runtime suspend has already released it, then
mark the device suspended. The PM stubs also cover CONFIG_PM=n.

Set the initial runtime PM state next to clock enable so that probe unwind
can distinguish that reference from a runtime-suspended device. If setting
the state fails, release the clock immediately and return the error.
Use direct error returns once devres owns the remaining cleanup.

Fixes: f561ec8b2b33 ("dmaengine: Add STM32 DMA3 support")

Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware runtime testing.

diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1721,6 +1721,16 @@
 };
 MODULE_DEVICE_TABLE(of, stm32_dma3_of_match);

+static void stm32_dma3_clk_disable(void *data)
+{
+	struct device *dev = data;
+	struct stm32_dma3_ddata *ddata = dev_get_drvdata(dev);
+
+	if (!pm_runtime_status_suspended(dev))
+		clk_disable_unprepare(ddata->clk);
+	pm_runtime_set_suspended(dev);
+}
+
 static int stm32_dma3_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1755,6 +1765,16 @@
 	ret = clk_prepare_enable(ddata->clk);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "Failed to enable clk\n");
+
+	ret = pm_runtime_set_active(&pdev->dev);
+	if (ret) {
+		clk_disable_unprepare(ddata->clk);
+		return ret;
+	}
+	/* Release the clock after the managed DMA device and channel IRQs. */
+	ret = devm_add_action_or_reset(&pdev->dev, stm32_dma3_clk_disable,
&pdev->dev);
+	if (ret)
+		return ret;

 	reset_control_reset(reset);

@@ -1831,17 +1851,15 @@

 	ddata->chans = devm_kcalloc(&pdev->dev, ddata->dma_channels,
sizeof(*ddata->chans),
 				    GFP_KERNEL);
-	if (!ddata->chans) {
-		ret = -ENOMEM;
-		goto err_clk_disable;
-	}
+	if (!ddata->chans)
+		return -ENOMEM;

 	chan_reserved = stm32_dma3_check_rif(ddata);

 	if (chan_reserved == GENMASK(ddata->dma_channels - 1, 0)) {
 		ret = -ENODEV;
 		dev_err_probe(&pdev->dev, ret, "No channel available, abort registration\n");
-		goto err_clk_disable;
+		return ret;
 	}

 	/* G_FIFO_SIZE x=0..7 in HWCFGR3 and G_FIFO_SIZE x=8..15 in HWCFGR4 */
@@ -1861,7 +1879,7 @@

 	ret = dmaenginem_async_device_register(dma_dev);
 	if (ret)
-		goto err_clk_disable;
+		return ret;

 	for (i = 0; i < ddata->dma_channels; i++) {
 		char name[12];
@@ -1878,12 +1896,12 @@
 		ret = dma_async_device_channel_register(&ddata->dma_dev,
&chan->vchan.chan, name);
 		if (ret) {
 			dev_err_probe(&pdev->dev, ret, "Failed to register channel %s\n", name);
-			goto err_clk_disable;
+			return ret;
 		}

 		ret = platform_get_irq(pdev, i);
 		if (ret < 0)
-			goto err_clk_disable;
+			return ret;
 		chan->irq = ret;

 		ret = devm_request_irq(&pdev->dev, chan->irq, stm32_dma3_chan_irq, 0,
@@ -1891,19 +1909,18 @@
 		if (ret) {
 			dev_err_probe(&pdev->dev, ret, "Failed to request channel %s IRQ\n",
 				      vchan_chan_name(&chan->vchan));
-			goto err_clk_disable;
+			return ret;
 		}
 	}

 	ret = of_dma_controller_register(np, stm32_dma3_of_xlate, ddata);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "Failed to register controller\n");
-		goto err_clk_disable;
+		return ret;
 	}

 	verr = readl_relaxed(ddata->base + STM32_DMA3_VERR);

-	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_put(&pdev->dev);
@@ -1912,11 +1929,6 @@
 		 FIELD_GET(VERR_MAJREV, verr), FIELD_GET(VERR_MINREV, verr));

 	return 0;
-
-err_clk_disable:
-	clk_disable_unprepare(ddata->clk);
-
-	return ret;
 }

 static void stm32_dma3_remove(struct platform_device *pdev)
