Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727191;
	b=oRtSWOyCDIMHH+0RyNWFVwGT8o6ANUguCYUEKZXK56KhJq4+NCRAEd77hkKdczDmpZ4x
	 WS5bqg4Ro1zkaDDCymKTNftx1PlywakGsI/xaNGWZ4djoh/3mL3ERN+/2BCf+p58zNIR0
	 Q8SIgFx/8+6pVAGXGNwesy7AyeEIhyHWhRJpwX65aNdipohVyt2vrgT9PJJX4yk0jvJIK
	 WZPrFSEoZl+g3HaYJWEsB52pBNLAI6PjQA8/JlUKIFQ9AaCdYKjEQeVeWBuLE6yYE1G76
	 AYNlRyMhBq0Tx4p5tI87nO9lBnRXq8+DhrUcJO3zjRPV9ouDYviugWyYV+OOeQuWCyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tEAC3AEP0gmVOZIrEp2K5naXDusA8lAF2Ew6yHoW5j0=;
	b=saw9GLqZd/c5M/MeGgCrok6/vxQcgGIODM5MFR20/mL6Ku+lJIz9mzpWEKbg5/DOnxrI
	 HPE1IPlNw0Kyunz0yppK8GTp5PWN2UX1FebSiAl3WwDcJZ23Y7haJtS12fGX8iNJR3ZCx
	 fWMePsrs6D8C5SmmGERGjcv0RzZ/8xP1/IE7JcwS+bi7eJtRX7G+D+H4/Pihysm7i/yFz
	 dNAKMZsXhwvL4SGBVmY0zFzb5bNlAvAgOvm4lTSQcLOu1O7che1BdZRZka36ZkyhEOSbD
	 kJJQGOJl0Hj6Kmmd1YaxYznEZc+FP/pSq+/bl8NNw+jPIXJDOJ6ABb1jxcr9RIryUmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErPm0KHX;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C525D60A2629
	for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 07:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C525D60A2629
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ErPm0KHX
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70059e4dab6so2080671eaf.3
        for <dmaengine@vger.kernel.org>; Sat, 14 Nov 2026 23:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727190; x=1795331990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tEAC3AEP0gmVOZIrEp2K5naXDusA8lAF2Ew6yHoW5j0=;
        b=ErPm0KHXB4Mv060O7w91PxAQZnj4lSzJqaCrlPecymxQxZufCsxz6cv+hYWfhbtihU
         pdJqmR5A/OiXJ/6cVyyp6OOa9ckp4ZrXzfGv9ttSWI2Wer420pQOhk64kRy/kl4I7ncS
         EaF2NZJtozE1gSVbKoePM1btESFdANQr2KB+8S7+0x8y4BrZfEg6Sm24malWI/UyEst0
         +JWgrXFsw4Ondp1Bnr4KDxzb220OjFurLOOTr/hXUGDG18a0K+cMOCX5CGs6ZUQUGC7s
         ++h1hAvHkHb1fHmX1ASQBODhwj3+xSwSTDOC+huEIrHtHpTM8it1Ig3jrDHMh6j2iViZ
         L1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727190; x=1795331990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tEAC3AEP0gmVOZIrEp2K5naXDusA8lAF2Ew6yHoW5j0=;
        b=Ijc/y16DPNG18IZxoNgczqe0EruHjQE0TVhIMZrElYH+eCnwkIrgzZwVzgS9CHaC3H
         MjBoCnsr85fe0fapNxKZjjJZ32sEh6yh1tc09C5DPPn7dSkHO8rcXHEgESs4KU0AF3Ng
         sz2fcYXBPdARvCpDNSw0j5w3mvB+WHW44rTyGo4eMBwKGRFF8zyLphljgCdnIIJ/rtEI
         gqRJU3ju/IXgrgaAMiYsEvEjqwrJu1//43eIlDftgXrDiRQvMbgEKVw22oW0LT0xQFsV
         JYojK3b/H8X4RMh99WC8Wffi/9SXC0tqR6Ja9WlCH1x16NU8FvuQXuZ+zrjuimNsMMav
         r0jg==
X-Forwarded-Encrypted: i=1; AL+hErESjhA/ko7K56oSTkpF4u3NExdgjRG4Qq66zvFOKfyPDawCEgNdLRUlv6j5anQ59byXVhHNsNQIbhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hTUuNBOJrvHkwV5YFwag1AbWdT9mnMrb8uyLSGl2b23kXqzCF
	ONNKq20t42h/VD3IekvGrpVD9z8MksheuWObMO0192vpN2A9sAYkPY8s
X-Gm-Gg: AYBFou2B2EDmcnnliHu3/RaX8FfbkJdJ7wnqIPg8AceHGm+6oz/AKuDpTzOFSbIGIf1
	KB1DFsJrYqgSxRnCTbewGzEBTB8XrKDtBMXBC/Pdvwliv5bHTPr4evV/JsZfA1BoWjreL1cgL2G
	GAVBb43jzSo8y1X+KYPWb2F350TAkA4S/sC1GP6H458DtTleMV+vDFxVD9u99rudVn+HGR0QiF2
	KlZA3k7DGo+IadCNST+U7wl8t7eXT6A5MSbczFUq87eCxk6EhA+llBerLaPJC3x70DSmYY9BiKh
	O6aGWKSSX+VwosMIYaYEMY/7FR0oRsx5W0Y9v1kAe66GAqI24W3lpWQqwAX0HGWNwcC6Plsmagn
	FyiPWkXntb2Wz88AqFl0uD/GZgxo8A5g7Gmvw1T1XEQTu38Rk5ftUasLzhfqy1uNwPe6SEIWa6U
	fwJa8iwb1lep/bAZ1UAuBcvK/5e41b6TC9oLNMOChMj0XMb9QAzUyzZ7dy0fW01Qr/QbxBPJ0Tw
	TNxFEpCqdGHPMjG4CCnYNlx8ZoUIYuoBsn4GAE4nL5fZ3hKAA+7adpAJOb5KxSHeRw11hlJgs6j
	2EYCu+Lv75EKPks+y2GQJ1eYvU/XYcMtgBgQ9GRJMndUQMhpHhl1IqPj3HeZXlKzmhnQfIZpFb9
	S0usrPF0SyNWcS2+BatB4TOcbUWMj8V2bt8uxuuJN5UoTAp5vAHDl7YWoemBiQdMuZQx/kMsWwg
	tPAo2FBwGObZEimf6/B6y90Zx2YvpGpvQ6yM7kfZ5FBNCplDAYZHA=
X-Received: by 2002:a05:6820:1385:b0:719:204c:fae2 with SMTP id 006d021491bc7-71ab4fb81e1mr4716551eaf.28.1794727189811;
        Sat, 14 Nov 2026 23:19:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ae860ebd7sm1145321eaf.8.2026.11.14.23.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:19:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 00:19:40 -0700
Subject: [PATCH v7 07/10] dmaengine: dw: report residue for queued
 transfers
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
Message-Id: <20261115-submit-dw-dma-synchronize-v1-v7-7-8d58f3d49e4d@gmail.com>
References: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
In-Reply-To: <20261115-submit-dw-dma-synchronize-v1-v7-0-8d58f3d49e4d@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only searches the active list, so a status query reports
zero residue for the queued cookie even though none of its data has been
transferred.

Search the queue as well. The status getter already reports total_len for
a descriptor that is not the active transaction, giving queued transfers
their full remaining length.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 3cc8579f8829..c602ea01cb83 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -927,6 +927,10 @@ static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 		if (desc->txd.cookie == c)
 			return desc;
 
+	list_for_each_entry(desc, &dwc->queue, desc_node)
+		if (desc->txd.cookie == c)
+			return desc;
+
 	return NULL;
 }
 

-- 
2.53.0

