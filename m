Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826393;
	b=AUTtdm2jPZQ+mUqKRfWykL0jkJmkijnE6dEYpIvXyg1PGTOKZAgNR5uZJxkfhQOX7dR1
	 xOTX1mNBL0ryK0wh6WeKQ+Tbvlqhpq2rQlGishpp9OqYXpv4gPICzbqi8MpkYKvz7cokG
	 7hEfRjSxGGBS80R9vGmWj1toCjWqHOMZef5s8qdKrb10z24H8F3/g9QrCXpClbd2tzlG9
	 RgeFObgK3ZvW7EyvFmt7BI+CVfMEUBG0XuTdaFAUT/nys/Fu/1H9wN7tZjWLzwyz7+/uR
	 Ki/LHOtUmgP/gRkr1StKc0GWc4QviT6e3UZwT1Fsds91s7hqqSwb7QAQU1sPyMjsatQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D0gFB7DdC88teePcUFhLAHdEAYFbs34TNYi+C0CiCcI=;
	b=FNMQCmPrDTvhDdvT2jtGVnhNLIgSM7/ftPFe8pmpvFPNkxJ/bhRNM8TDyEWVIVZ7CF8w
	 5JcJoquoZ8AS196Mp9muvihLubLQLU4PZy/1s0zzl+KXTivQNssSMc0g8lnu4mh1SlLW4
	 adro34mybPL3e12Y46sBtxQxltV2YPOcuCPXxLRKr0Wdj9mSuz8hVfeTMN7QPyxF4lrHg
	 Uh1bSUeJh06gKX4KpuHSKvtVyjUvMCQbC5HQahX66WEE+3dsE1T5CC2VR7q30htU6ysEk
	 IaC/UcE9qgS/0AiBjf14+sdnNS2x8YWA2EK/GBLQXPaHXzGkLOi/5VSgoFKk1Iq3tNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMUofNYN;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A89606A335
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 10:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A89606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fMUofNYN
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-84a248254f4so2464464a34.0
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 02:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794826392; x=1795431192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0gFB7DdC88teePcUFhLAHdEAYFbs34TNYi+C0CiCcI=;
        b=fMUofNYN7W1CyGO7ZvAF2FWAa2qYJcu4r4eowj57uVHPp3ByNFlMHPfRkGCA4jU7FN
         O8hbQpzvjUUjro5m8khTqFBV7CSBaumnQz8MsGatmHSRCKKF4NBjtYbD0wIRF/d+EqgD
         XcbcKNluWfhEIjUa81KzsXUH/YE6dCclSHOrbf80Kz/p1DTl+RDjYboCmkbZ61Uvpkjz
         jQhN7nNrRFcYTMTRRiIYOSp55YG80l0Vn+HVQkP0KLb94CjlgMxkAaawwH6TOpIA2QQH
         slKH4k3tzGsiYbMloOdqaa+9deaXiPf3fQp4ettzDL4c7sNL5HaK/ngKNDMTCc9HW4kk
         nXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826392; x=1795431192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0gFB7DdC88teePcUFhLAHdEAYFbs34TNYi+C0CiCcI=;
        b=b6sxfCQrb3g6+x5aic5xSzGvgHRWsUYS+XWPIdn2virywRpbxTezLhttjtjB3wNZnr
         zgkSfoFIwf/whjrsDKZyc5hqjTaHe+GHm7g1PXk5FbduNswCEgHWrDw4JecFRoQnpsAy
         65FKx44zCgW1np+yz3NNVKH38k7icqcTe9Y3uF3ZsT2m5rqUHNF4Hu46RnF2hyhT1Uha
         gIABR+ub8SIg9mPL+xZRjtEC0wqbbtlZGOKGjLxsyhqDw3ZJ21UM0+ymUPPrnSjQmX4X
         XHIuTe0Kwy1Gl/Aae7YjWbpbS/I6WduOxn22NkfoU0mMFtx3w3DKjobR2fbetFffq/tE
         ZhHg==
X-Forwarded-Encrypted: i=1; AL+hErG7Qw3/qYNaYahw0pRXfKx4edoe3Fb0IEA2K9LDobFYgyOFTP7pDdS+RLa2dG9i18i6BLR/MsCiZJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FcLd8UhV7eZe2wqf1Pb91OxJCAhw5/aH3ZKoM5tFqtv48/iRq
	QYBvxb9d18MM3uCgpZK15trSAMxfnJJe4zYKPCP3kKOcSlzlb8HX9bd9
X-Gm-Gg: AYBFou04E2bVc35r0O5CrSVGk4wsr03S1mp0Q2v3uQmzwWKIeWgeM55aouUSSMcr42Q
	lRPJ2ErSiArr/03w/N293slFen/BNJUpMLZvVRXljjMmmROWJG+yu9fmrC9JuMau2U+6FI5gV1M
	vuxdDrKxPaPgY6EVbxH1sk2tVfWvS+kwZSyEKEDFrNaI5MyCbaIfMm2g8C1hEZtUW385qlS128N
	m/w7hUu+KIzPYT8pzsNrdWa7xjhJdNAFNgl8jIe+ng4LEGRC3P/3sUwDhU/WbWzSoWSq6vFzL4M
	nrrlDyIigEY39QX1o80+aUohjayfqhlQIleW667AXBNNB1tR6423q99B6bQZu3dT0Ht/AI5KVph
	X45x4QOHDV4aM/RY4ps1hNgaqZNcCAUk8S3Ptjz+0tzGw8cm8K++W/WbuxU3btL6VT7oCv8fslZ
	DYz8cYEr5x2GqWh7VE+RXHGW5a0B48UbkgrESpo5XwbPgL7HaXh7dHWaFRGsRi83X2BGn2fbErW
	yDRYhe3XKKofSIjKm15s9EkfiSfltSXo8XoNF5nYUXVxbHN6ZbYY8C9aYOkqqB5SVYosl9XiKhe
	AWn2Z6TWPi8RTOY/+o8pGX52OOTuT+BDqMBXF4+Q6KnHqjTeWgR+W48/79IXYk6bBiImgMcQ15K
	pQV0DQYBJymBtDZp/RAsgfE6GnSHLTIBLXWmuJqYI844etVwUhl+Ohs4LdNh1yQuJYJBpVSd3I9
	BQ3TV/+rvyHYlfY6GzHcT++1sGBnEYyeumr5SLPa1g8qjEFMTntME=
X-Received: by 2002:a05:6830:854b:10b0:862:b9dc:183b with SMTP id 46e09a7af769-862b9dc1e62mr2195212a34.27.1794826391709;
        Mon, 16 Nov 2026 02:53:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862b08b8b5bsm5555546a34.5.2026.11.16.02.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 03:52:34 -0700
Subject: [PATCH v8 6/6] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261116-submit-dw-dma-synchronize-v1-v8-6-4a82d64fcd1a@gmail.com>
References: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
In-Reply-To: <20261116-submit-dw-dma-synchronize-v1-v8-0-4a82d64fcd1a@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only checks the active descriptor, so a status query
reports zero residue for a queued cookie even though none of its data has
been transferred.

Search the issued and submitted queues as well. vchan_find_desc() covers
issued descriptors; submitted descriptors need a separate lookup. The
status getter already reports total_len for a descriptor that is not the
active transaction, giving queued transfers their full remaining length.

Fixes: b68fd0976286 ("dmaengine: dw: move residue to a descriptor")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 565d01c9a29a..5a7be765a0c5 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -867,9 +867,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
 static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 {
+	struct virt_dma_desc *vd;
+
 	if (dwc->desc && dwc->desc->vd.tx.cookie == c)
 		return dwc->desc;
 
+	vd = vchan_find_desc(&dwc->vc, c);
+	if (vd)
+		return vd_to_dw_desc(vd);
+
+	list_for_each_entry(vd, &dwc->vc.desc_submitted, node)
+		if (vd->tx.cookie == c)
+			return vd_to_dw_desc(vd);
+
 	return NULL;
 }
 

-- 
2.53.0

