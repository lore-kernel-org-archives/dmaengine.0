Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794955752;
	b=VRqt15vdLbtCAGI8iJYSAQ3hebQP4wGAyJmXkpf8P9Y3Wwzzau+nmsB7WE4zittEBM8i
	 h29YHdq/6XlE7r181SQb8gmM5fOHZpKW4zYiEmW2IsUjzwvXuonYy6VEBr0CopIbA1gm/
	 ymshZiVZzbdX3G5quBp+d11gXTC9xIvEoatsx3R1vO7uMzz/H7ruRaRTwGqtBFJ8a9pam
	 wFvZhiUm2dmtp2s79F2sRqMAjLXfObsbYjhxc2fWWRD2MJuOKtNA373QUDOtO8YH8RJ/z
	 JSNaxeCyy4UYzQRNGSKDH1VMEX7tWnm4XZDzim311yDx+wTqfBjCIesW5XMctD1pBbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794955752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=k4Qm7XpfJ4IaAnPaVRdhRvip1Jdg3xw+SpQe4yTzGGQ=;
	b=X9CIJHWe+PY8XvelGNbEK1MXzTs6M5NXu9gsNDu5EJsTFUcUTsSId7yU8q8F/OKSedNh
	 jcU3g42MNG2KXwUQSoif0DN/wvxVHryDaOINKrnBwPZVKJG01wfbOn0d51wLFeHneNbHJ
	 BOfG7hCk9jHSmMVQXu9yCISkIbu2+aNOwT5AXEJTHd/dd7I8h+bevHRk/qen07W6vBalo
	 mz6PYDuUQlZi60JI7DEQajdDzshULzs2yjvhqyBaGEU7DGyNDioEMorXpUWfi3aBuhxIw
	 3Bg8nd5B2ZSneNjcNcZDBvQr/M+eDyz86QBKx6mKJeARkBhbIree+LuksMg4CH02wwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcwrOPy3;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C9606A8A9
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 22:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED0C9606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PcwrOPy3
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4877837890fso179201fac.2
        for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 14:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794955751; x=1795560551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4Qm7XpfJ4IaAnPaVRdhRvip1Jdg3xw+SpQe4yTzGGQ=;
        b=PcwrOPy3tfi3YBg8v5BHLPacqa4Td08uSUMN6sTMXCUIRMVBFU0iUEooEMj2SWEqLZ
         zXlwALAmDbfl86YT3JmsMoeUpVm2mCP+trIJhMj8bvOQjrGYGtgP2z+G43mSEWRN9teR
         JhMPLX+NEdQv4vbBfnEVSh7rUZlShSX/6NR4yFEuWXTL0eX+/+u14h8hHqBL/SlEM28c
         P9km1wHqaeOSrIpkNIoiX3N3TPYTq99ghrE0V2/OZDo7CA/+S7MwKVMnM3OINxV9XdKX
         nAD2227a7/DYkwBSGKsGxWZQP79S+NhVi0P7S5Z8G0smZSgYa35O/rJx0/w+yMbJe8lY
         CYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955751; x=1795560551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4Qm7XpfJ4IaAnPaVRdhRvip1Jdg3xw+SpQe4yTzGGQ=;
        b=feiq9Lq3rtb7qQ37Uy6Wm+dlp5fZAHJDbGX0aQ0wo7GrlLf0OIfhgjfnr5Ot/jr+Ha
         +6mmuCyODkYNXiYhVLntzDqRHQF7Lbcf/APUsK7y60i9ItqNgruIEpCaNHIC3kSU8Dxl
         VQioi92VUhAdm828iLJFXPME80nQ80QK9UkXHt0/mcV2nb+OBW1jRDIKRLjeTwkNXocJ
         7fqIyFZwniAwV7qxxCwlZGiiU45lcW4rlvcxOhuEhHUvuA45WAM3XPMmDtWf3XKk+XBw
         jT7mF6OsAQoBSAB56VoZU07sgGelFDL3L9Q8pSS8Ki1czumjAp7rG0bdl8zXbbZnaURg
         jQuQ==
X-Forwarded-Encrypted: i=1; AL+hErGuFptCs/BfP0WJ2Z4hxXHNPGhIG5RmzFHlwBeNXq4gyuymAocskLIlB+LKqcQJSK7VGyjVYq4awv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YIDjDgwyz0s2EYBQZOpzxuW6LwMTUCY+UUXLbaLn2Bz9Slo47
	VK45zo484PB5h5VRD6LsXtMjqUCsvus7X4xwRCaje351qosm5c21tlga
X-Gm-Gg: AYBFou1klU7Pj2ZqWMaWBgoXWo+S1Q6aQPVUQtPvZskV6UdliRyxJzPj6g2HcHl6+HR
	u2RH5f1CNkb4/fBSp6Z9zjIm3icYNVmO8h3WzJ2djQ5RSKFnDe3eTJvy0jhJ+w/yShsxNplbp+v
	lQe9RX6yiaMBEAECYwalESEC3vEADJ8r3JBfqQCK7AIE8SjLsltlIehDGeYMRZHOoWxIPJoEe3N
	si5rD0/FNYR8pZSMcKSTVdWHaCKFGgmSn/JM3z4mb5QAZodoBkdkUrrr6gMaI8CTG/0AgGPYcB3
	XwCcDTwc3rCXu9oDkbHe9k92wI94u54GDM//Nc8FZMLjQ0JMoiUxV1PBa8qRElZhMpuLVbQ6nw7
	qHNNiNBE9wETiwJDIF2Ix2iaQax1Y7U2VEWXtyJpqJtWeUx/2gYRPsie9bUDDtLbBrCIJEhROmv
	MvDbF+2xdvC6v/N9SbcMJISQsboUsEBrJ/GL1MtGYURirrT19QjmUlGvQlfdwA3JMGJCqCUyxCe
	Pp0ISZ9JZwxcZ5j4xMEduQdnJJQkQiwBBpKUB9KoIjNCMOpe5M1tQ4W1U0ApBqCJi0fwxp/G94N
	3/sxYerX//fEUy47x9quBt/YZI//VT3aIsRR6PlAye/L69bLHs58w3VEy9wejkojPTeNz7tybIq
	QrV2nI9YzJyYW0bs6DtA9vzZFQnq32LDJKx1iDSAhKFApYkKSIapSF5jp4t/K+fWDP3nYxAd7Ga
	Po3ohc7WBtY3m3poeOMb0VXeWWzNBBRzgmCP/eHilUTCzOhaXWPqg=
X-Received: by 2002:a05:6870:17a7:b0:4a8:ffd4:9a6c with SMTP id 586e51a60fabf-4b75d850d84mr521682fac.45.1794955750772;
        Tue, 17 Nov 2026 14:49:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b74560af5fsm583066fac.16.2026.11.17.14.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:49:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 15:48:41 -0700
Subject: [PATCH v9 6/6] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261117-submit-dw-dma-synchronize-v1-v9-6-7dc066ed0bcf@gmail.com>
References: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
In-Reply-To: <20261117-submit-dw-dma-synchronize-v1-v9-0-7dc066ed0bcf@gmail.com>
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
index c138008d7cb0..1786dbe2e850 100644
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

