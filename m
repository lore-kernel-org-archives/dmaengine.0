Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795295114;
	b=4bZN+KwzXA1h3lEp/WZPw1Wm9rI1L2Ojl596C3Mki6LEA4rxb4AyM4T0CaFQgPvfh1Bi
	 7DWZiqWNtX2KAiUnusOuH7GBaMI1oTlC77aBLwjBnEuM79uJTr4qOkAqTYfru2YeoKhJ1
	 oxz3FeHpXjc3KcR3KMvuQLPUnGNeg6xu04EjHGBo8ZA8ZEIwXinqcMh79Ov9DKwHINTXM
	 +XoBz2/ZaPmceNy8kSoOA3mq4FVbpIHzkXjPCJRHQsV/rCPfl/I/vhHIKAEGWW3Kw78Rv
	 5HMtr+GLq0OEyzaK96iQs5OpUwtEX4UtX+aOLqdel4Qt3TxTR1NZGHxtRoTKUqvcnIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795295114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=NQnbPfOzKZsGZYbWuagccx5bm/OCUTvNG/34f4erQB8=;
	b=vPvyoFnZ1SIEBsqmQeBehXCs8mLJHWBhb4QlpvtaVAabUYpiboLAg5RTr7vj8AsYqmp0
	 Lzfyotqa81sAMrHcd9vHDDgraqdE5hEBWofLX5ytOCmzJbuVNn9bK8RwCgup+S4hzEe/h
	 rloXOHrkXH+i9ioFUb2IIcURxXwVay+rnI2TtjRA/USxraR2OqXxEo0UswrrQ/b99fHZK
	 MlI9DgJdVE0kMKrqF/oA+QAv1D5oEk1skVdRcyUnTo6lOtri86eGVpRQvXFDAb/9zHftj
	 ORNsleSVntL98IVUAV7pLu0RQWANwS+2FXC2QW02JlDkrjijjRsHVHFKD/uJjGv455g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IX7vznIL;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273E606A6A7
	for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 21:05:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8273E606A6A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IX7vznIL
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-862b3938d98so1056089a34.3
        for <dmaengine@vger.kernel.org>; Sat, 21 Nov 2026 13:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795295113; x=1795899913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQnbPfOzKZsGZYbWuagccx5bm/OCUTvNG/34f4erQB8=;
        b=IX7vznILkd/CCVxwf4ciGJ2ED21G+VQpoY0/+tApV8+6vFo9BV1d6XlU9m2qYT9GZB
         jQ/J/iUxKWfpcq/LOwOJM+Id5MOyF0c+1zH0hgYpgnOkLPgwQ82Ky6YrCPcU89Rb6z6E
         LmX99YzDz1KCdkIIjjqBK+nq82jrRsCaxvlqKWILWmssSEElKScn6+/5xNRM7BEX4YNi
         wT/hZ7TAEqYIyprnRFra37qMWRfHx90t94makB9jOvKD/0E7tTbZcjcURQJ4hStg5E6q
         mbQqgqY32MST/9pW3kKW4FZHXllcQDZB/ztUBNSsC1vcbrBMkvfvXy12J6Y6GlHYl0c0
         K00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795295113; x=1795899913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NQnbPfOzKZsGZYbWuagccx5bm/OCUTvNG/34f4erQB8=;
        b=UYexsJzzPdBPRfa202gd4UZFXE0hVswbc3651PzdDuCer+3PJDtMiViGmDLS/bI96u
         VmVjtEM71cQ3dglteseXykz8HOUYJ+eS4dVC8Mgt4Ili5a8/pJ8WwJaH9PxQIEUZQgQR
         1u/lp1zdga4EOHL2biXNWS1wWDW0J+FnDTrWggTjgL17N0Kc7XY7IPitViGzDq2VyVw6
         j4xpG9KkrE98gMn9FwWqxpE4DNPwCJExz34r+S/KhQjvuN6B0xPAGJApnJmshqcIMZJM
         B5SKDvGq2gId0YlAB691tLiSdCjgBcYxWptAoPZfBm9Qs3sD0hOWb+0rnDNapJ/OCKNl
         fE2w==
X-Forwarded-Encrypted: i=1; AL+hErEi/qCuNDmT0XoaXL8iCV2k3H6JArR0Nr3OQjVXZJSo7t1bDbV+yujyknEmH54r5bjPiqMI02jtFsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8H+Zl0mophRyTHiS8s4NtMn2il8MXlUVFGAFsUlGwpSHFUPGxt
	65sqPvc5/DPOmHS0SbmT006gLrcLkNTNAOGk9XZUlZg9M7T9uH3li+7R
X-Gm-Gg: AZFdTZdeuhxMQGOu8XUb3VT/otQWJ7468sS+RJvbt5D8lxOSGfF1k3S6qAMSkmw7zyB
	LKaCNl5hpzfv0W6aS5owTfNLajgjcdKnNUJspb37VEE2gUVfzeNgjJRAK8SDJSO2SBWu9YUJkyu
	5cbW1UrtC/bopR3RJ/iWNP5ofgzk+0WR0yCalBVHPOTM6quzhpAaazLWmf/otr1rb9yHHrVJfTw
	LZyXVwYsUacKmE59sgjb/LDpKwf38lh5/euMTpnWgrX7uFqCzfw6fyRV8ppDJAFCsos8NAR2t9g
	k7BXHt0/1+Qtpc7sIRf6kLrUZ+tRG+YLgivnmrnNwvjGMvpy9XqkeKMCFcBaGDmhl6KJBXXHQiF
	uowopynP4mkwwWEhbjr3SzAYvTh98oGSv3v5Yk11LhGB5CKrC7UAFXGQQddPxTyye95bjiz+pro
	O54LTB+IipgdxRZpfoFnJ/prvp0Y6APDCyId+f5wJlMgxVrdauKj0nV5BOWoceGLvuHbWItYqEF
	5mTGv6FFGnrlmqRs0mwypxRIMKeuspnnsOkRFb2gdwAKSIfC6HH0nJ8/QeRxhz+4DPe6KctVIT0
	t4Y1ewT/30MKcKrc/eFg3UyOU/29tbsMVqDwoVQSEbi2bdN4T4zaaR31rUVtcMerxRNex+Ze9kU
	BOtJss3zyBJPLM9VmOmJEzW+rOJHDqOGKazClmSJqQa54tnUDaW3kyuF1lg5iu7nA3QOVNUWxQJ
	d2dtzTKOqSwgHG50Y7F9KPNZzd8ATioZg6I9uPojO5V6w5oGNuRRnD
X-Received: by 2002:a05:6820:570b:20b0:71a:d8a5:4d1b with SMTP id 006d021491bc7-71b3947aef8mr4275597eaf.36.1795295113480;
        Sat, 21 Nov 2026 13:05:13 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm4635728eaf.13.2026.11.21.13.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:05:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 14:03:22 -0700
Subject: [PATCH v12 7/7] dmaengine: dw: report residue for queued transfers
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
Message-Id: <20261121-submit-dw-dma-synchronize-v1-v12-7-f51eb635209d@gmail.com>
References: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
In-Reply-To: <20261121-submit-dw-dma-synchronize-v1-v12-0-f51eb635209d@gmail.com>
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
index 302ff591cde0..88c14575a604 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -944,9 +944,19 @@ static void dwc_synchronize(struct dma_chan *chan)
 
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

