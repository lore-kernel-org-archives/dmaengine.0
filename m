Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744785;
	b=mY4Z7SMTwLH1vs8ueEbF7V9uAZJNJmK02UPKTzc177Vcf7h1Fmwb+QWua/Ke4dp3Xdcj
	 DctMu9EoFVhUt8oE2uzxXBaz2AukNmlJI2bkgjPaVfHLuIAN53XXFJEhQPzAnsIZA0dDZ
	 Ax4NsoGALkZ0rJYMtaiQmcTGtxaLXP8wITsqEwTZQ/9j284E2F+qoJOAoBoEDKLf4zydn
	 I4vlAUT3VbtFVcAvK0YT8lPCJvQHG/mLO/+Mzwfujputct4FGmDMZf8L//GBzmNChnTVH
	 isHbuI4vle2asYuFVdzDmsmsWTUHKJouZG1xwTCF5V63NMSMB11P7X85Lw51DgC1IIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6B8/kguaSg2buIHgi80qhLVJe9NS42NHDxy6rcmAb7Q=;
	b=ND3PRuyHx79g1F1NMRFCbCSAensMwHbjW4NhyMk0+j7x4yYQbAPdbol3Tmq3Tjnz3qZf
	 nnxTLKUTRmGI1l3sY2g2hUHfzRryuZtzfEwJlYEafRdXW/MJdinmjDB8kf/vEOmE4kz3/
	 SVrARUYElFJhXktiyh3N60cxFLHcALd6JXNU3+BDyttCgCVxH5AOzNnze6hvTkhCjB+eq
	 nAUggTJW9j55yvfJkuOP2k44nZLFEMBcQxzSXKdxtMYoKNNKlNU4vWI3eUBkiwcdBBDUq
	 GCAHEND4TGHCljQ9XVlx4fIeS5RRDPdGjmUclwOymXtRxRxdZ+cT3EJ14VnKVExqpLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKKvJtHq;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF70606EE89
	for <dmaengine@vger.kernel.org>; Tue,  3 Nov 2026 22:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF70606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKKvJtHq
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-82109f51565so23258a34.2
        for <dmaengine@vger.kernel.org>; Tue, 03 Nov 2026 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744784; x=1794349584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6B8/kguaSg2buIHgi80qhLVJe9NS42NHDxy6rcmAb7Q=;
        b=dKKvJtHqdm+dQxArWG5tGxKUXakQohe4whh+UM5E2qaRZ1J7QSOeRNuNLDWDinX5Mx
         lQQZ7H8qQ4R82unXTabFMRowb/yFBo0l2/EmGQqhYmRvPI/+EWwwF1Aj7pkymA8foqX0
         KVODrDZ/s5scJCvp+Q5XBT/oAMbGAz5freabTv85aaA/PCxkoG0VwMuip7KhxDJYT4oo
         Al4baaX65eKEWob2gjxWTk+jiwgPaf5wMaldkqcxAJAASNvnJSBK8dDwxlGSzyKG/kp7
         c6JoJGR+S5phFX07DUxJTrVmvztBj9YllLtye7LHgx2E1CsyI+i0DGjlLrb4gKT7SQxy
         Qq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744784; x=1794349584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6B8/kguaSg2buIHgi80qhLVJe9NS42NHDxy6rcmAb7Q=;
        b=CfDBcTXBDiXmZbcA78ZUoWEXOKAENG5CR85m24+tHEl7WSzGZ1fYSiv76Wemix0uyY
         sjZEVDD2+7Lg1ce5ygQC0P3jrnfs/zQ0GLFjeLSWrVHrqDt0XXChBcmXy1X68FXKXGXV
         biiv4Q47qVZAlER71TZdB2cYMe45zV0wDsssXdTFhwgriPyHuygIQ39BivH9GfM8Nvcu
         qJuABJ3uyhN+PnQEYR3mia3udg5K7VVmTjtuumL0aU9LO59k6BYOf8vRCjCcEFeBlOjf
         xp4XcTDCbCrQqioDgRvHeqGo2yf2sHnw83YfIqjYziULSXUwbINf1jd6B1HiRnVH/xHT
         2GRQ==
X-Forwarded-Encrypted: i=1; AKwUvByyTlt0SKhdId90KM6cbDcgwR2PutBcDHG9DLYMsgi6Px5wQk2zOOHBIIV2VaFeGKjLlooAZf6d9TQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kfrhr5CoThSY20n/VkjKddRjtOInkM9sj8UpLwMcwJtdtysvK
	0U+7xpoHsxGSC69qx+3JzwmvdJsXNHsQbjEPUiER5isTSKv/65VCpDVU
X-Gm-Gg: AYBFou3Zdna93Sas/AjcBR2jwT4l5XL9fh9uDmAw9a+yavChjGaHUinKEtiDlFjXgKc
	1U89w1xXIDnPR6nngrfcOJwDnFar1VcYwgdtGCPmbfC/QSoaLB3nSB6ffTIWtyGjQX11hwiB/5+
	T8hewFl7SrklhBUI0aKOfD+VpnAZbHk1Oyqwflc7M4TkW6lxEdOXYhhEHApRMkSQ3uj1VqDrI6R
	d3Ditz8Ib0gBpVOq9JqNtpwP7Mw4+Yody0gWyklIUUfAz2z8VyOc1Z5L52WpUoUHfwkjZPeztOM
	Zur0nKpfz+aA9fpi2awOsgj+XCsJkbDos6QMiv65+r6dUZRRecVb0dXSbmDWkmEWc5JvSR9eTzV
	QPgvGZnSuhbkl3iFidLmW/A7sPxTSwjzMvesmxjAQ0RVO2Rr7K2QF+8bb8rgJMQmn+kmmzb9Nxp
	S/jf3DmD+48/2v1svoOSHtpP+iatg7oJSP5dxYKEqb5Qs+8dqmgP7lrkHnf5F+DCkaTUXPecxml
	M15e45h3LRqfhG2iGuiD3LA2+6VSbrsbrpCI/rzqwmWf5arP7DhtAxq/DSmkt6rEDbQjmR+sQYT
	tyoon5C9oFSqx88V38021FssAC8ojzdsT21MDhiu/EhiyUyK46mOXIGdPLzV8aKv933ITUqrVzj
	5JAtLIcBJEhQW2Ywb1ljvlc4z/mzBDLWaeIqaK8c6J64IjpkhGRQIQ/K7xGcC8ENtPqJCLx1LrW
	Wu5wIDb0nabgaXaZ4UEOx6O5cyx+LhLYwHJFPU7QVxAntgAdRt8JU=
X-Received: by 2002:a05:6808:f12:b0:4f7:d324:bc5e with SMTP id 5614622812f47-5640de72cdfmr9730628b6e.58.1793744783949;
        Tue, 03 Nov 2026 14:26:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:09 -0700
Subject: [PATCH v6 07/10] dmaengine: dw: report residue for queued
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-7-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
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
X-Mailer: b4 0.15.2

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only searches the active list, so a status query reports
zero residue for the queued cookie even though none of its data has been
transferred.

Search the queue as well. The status getter already reports total_len for
a descriptor that is not the active transaction, giving queued transfers
their full remaining length.

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

