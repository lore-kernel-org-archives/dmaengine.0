Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202048;
	b=gpJAbNJp2kcmOdp4VWYd58hhS/SSckgDPdOIH6Jy/SqOp4kpG4ref11LCuMr4oWlA0ba
	 1p7k4eP9HabnCdJFqf5umNQjXFJiMal9xwxlqqn2ueSRDlJC66uledoHMWsY0oktwdEuJ
	 3Zsla1YI9+6uNMjj4jcwQd2huXiR9gpkZpWoqZ6D6/EzPE0lXXVD7NMiWMJOkXB0KAQvy
	 LY/BRq1zUnsqJQSrG4HQ1OzylmFhEZOfxPG+VCcxR8tdslspN5WznMdSrF5ZHn7hxl4Ll
	 mnOSYGaNaTgBMAlPrPxeHm95jU5ZxXJyuYVABG3AvIbziks3PH3vJQOnYnXu33L5/Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eAKYaySrSQHr6pJJw0QDlSkZ3hLgQhrVNe7eEGIicUs=;
	b=asuiQLyxS8nyjFli0wd82cmHFdSYdK8EAwDm5boNncAtX4ykplc87U2BZKgQG4DtL/D/
	 fMgD1FtJslYOLv7852aGnp7TE8N/Qb9N9tlEryqydWDGMkllKXCbgfabc+qsFz9XQvfCl
	 W2pqZoMA+lHfBZe+530PNPhTQPH1Mbm4cs7lY23QrFvSOWVmH1DQlc+W2qtrXiQ5Kn8E5
	 1jK2HTqzFTj+Djd5nuT7gBkBT0xkDPFsipdS+872qN6Vk50oXkWlR0U19XXFMd5NBy61P
	 63NDiTJbOzfTvuYbTGmDwywe5MfA/UiETjA09ryrLbjU99ZN4Cv12UID/qvRxki/QIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnMgl2Cu;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED53606A330
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED53606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cnMgl2Cu
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f84a55e31aso851158a34.2
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202046; x=1795806846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eAKYaySrSQHr6pJJw0QDlSkZ3hLgQhrVNe7eEGIicUs=;
        b=cnMgl2CuU+LJjonclnZ/k9to9GbpGYULFct/bYc5Bl5bKnK7C+PA71CLfOkHxpwS+V
         V2x5oRqU6XhvDyMurKvd3MmE/WJzduLTgR17QjdK39Y/o/LUniBHRWm5GjPuJm8Hw+y1
         k3+8EBrwsg6Fa2ScrItarXSLP8nmn0U/fnT60b+O9wgP9ty1FFOlATKQrRmR644mjSEZ
         JccUQ46RHOIfdpQoXi9cYyfPAstkzTCH4XGC2+Xabp7Ccg4qzOwR6r2T08cq3MY8jwQ9
         /Xpo0M2cMPNnv/uHKfrdvodSmVVqWIjmL7kzgEspXEsL2G5fTNozOOQjtBxFPqEVMawN
         yZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202046; x=1795806846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAKYaySrSQHr6pJJw0QDlSkZ3hLgQhrVNe7eEGIicUs=;
        b=UIPKmMo00bUWB4iBWcdDbexsq1ySU09QfARdxcIO7oIv4Ee37F1frM0bSVEdJtJQHh
         yJZkDuUlULjxLI5RLRugrLXZpU+3C8OltAsvKUZHGYWU27EXdj85b/cY+42eQirbD0ns
         xoT0QWoWlxQc+LmpORa1ubRyHJ2OP3WVn3EQUluwPbRGxdS4LCLvpNpwi9hyerDSRHyR
         +BIe7ehF2+8tBjaBJvVInZ01lETwMypKC7lvcgsZL2xi90qfGqMz2rFKCq5JUCt74Zsn
         7069kp7uZtoetVNfmqU4QrrZrPK072EeUTJ+Ug274Qa+hrOsJf15akmBLl3jdCcMGmMP
         ylkQ==
X-Forwarded-Encrypted: i=1; AL+hErG6cSkelhsvrhHdLWB4ijwv/GLeCnan8AxBanviCC4oCW+1zCW+WjObAH4FGBZmRgGH8izOL2GBPrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YrGkApBNvGLiKZ4BTjCz1yJJ20CF8ce4c1GQ/almHr3xhFYoU
	TxRTta7vKpXXw/oXhdkKT0SiIgpA6UiGlgWsRhLI0EEgo2TaJhlqEmrv
X-Gm-Gg: AYBFou0q3CEftocBBOWGHWbX6526GgHPMf9V7tDu3cY8pgvFHIj0Ni60baayYibWdsq
	uCimeAnKR7FYSfGwUd2F/36gv1JZu0rmeEUKN/LE3cl6dNP0ksJ+ApljJ6QRJ0nonlWoDwFwGqN
	fIjYKnjJu9TenGk9Vxlqo4tC11dL27H0PdJDFEGHVZHg8A+L2N2c8mxSMunBZe47/fmvbiK9ra+
	4Qbuud92d7QDtqewxCCGMwlVRW5/H+SDoZhfOC78N/LtgFFOVKJnYd90VfA2okyubzpv9ru5JKa
	CLqe+jWhc6lPsqZ2oC2T8iSRjrZM2i1p32po4yAmX8bq4oIi1O4AcX2LDu8Ut1iVWMxenWouwer
	Am00TufjXbXilUDeyKh6LfoDl0Mf2Q8Knf7Q4w575mHMul3+Nr9LDXckTY0smCxx74gHXpeOI67
	SDhIQVgkHPGKwAQW7D+KWd7yIk8KxjSP6OuNakhzMhTqJdvIjJgwumWBd24DSxULnGKwtRYtLEm
	81uhlnWOgBj7v/DIdkC8KFcPJ9/I/Ja8aOqzqhJMqcDqTcq7KmmFUIlFDJvFZqwX0ExVdFJ6nF6
	nH47anEcBkhu+/t/BZPeJj0hSMi1AdDKZld8K3sfOrcIV3gv4DI59Ii1ld6bvD6oeN5KlRIM2XX
	pd/x0Ir93YOw0dOshacsBnPwpmYVZZQvZIMVBhzFAqSYvbsH7NStIQ6I20v8Chpyr0oDJixT7ct
	geweS3nZ6Bb8DS6RKrHNLHaeZ2QFnUDKLV/WO3WCsIEZ4ZAAo6EzOy
X-Received: by 2002:a05:6830:681c:b0:81f:6e05:c1aa with SMTP id 46e09a7af769-863159c5575mr4569187a34.18.1795202045739;
        Fri, 20 Nov 2026 11:14:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:56 -0700
Subject: [PATCH v9 6/9] dmaengine: dw-axi-dmac: retain descriptors until
 callbacks drain
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-6-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Wang YuWei <1973615295@qq.com>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev

Termination frees every descriptor while a pending period callback can
still refer to one through vc->cyclic. An executing callback has already
cleared that pointer, but still receives a pointer to the descriptor's
tx_result and can use it after termination frees the descriptor.

An error interrupt can also move the cyclic descriptor to desc_completed
before termination. Looking only at the head of desc_issued therefore
does not cover every pending cyclic callback.

Use vchan_terminate_all() after stopping the channel to clear the pending
alias and move the collected descriptors to desc_terminated. The existing
synchronize callback drains the tasklet before reclaiming that list.
Descriptors already detached onto the tasklet's private completed list
remain owned by the tasklet. Repeated termination preserves the retired
list, including when called from a completion callback.

Descriptors that a client has prepared but not submitted remain available
for submission. Channel resource release still reclaims any left unused.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Reported-by: Wang YuWei <1973615295@qq.com>
Link: https://lore.kernel.org/r/tencent_C00D995A9F70206DFD1330DCB1222EEBCB07@qq.com/
Reported-by: Mitch Barnett <mitch@accuratesound.ca>
Link: https://lore.kernel.org/r/YT6PR01MB63707769A78186335441B06879D87F2@YT6PR01MB637077.CANPRD01.PROD.OUTLOOK.COM/
Cc: Wang YuWei <1973615295@qq.com>
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 99b648d4ca76..2547f9596ae6 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1202,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	int ret;
-	LIST_HEAD(head);
 
 	scoped_guard(spinlock_irqsave, &chan->vc.lock) {
 		bool enabled;
@@ -1219,7 +1218,7 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 		if (chan->direction == DMA_MEM_TO_DEV)
 			dw_axi_dma_set_byte_halfword(chan, false);
 
-		vchan_get_all_descriptors(&chan->vc, &head);
+		vchan_terminate_all(&chan->vc);
 
 		axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 		chan->desc = NULL;
@@ -1234,8 +1233,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 		return ret;
 	}
 
-	vchan_dma_desc_free_list(&chan->vc, &head);
-
 	dev_vdbg(dmaengine_chan_dev(dchan), "terminated: %s\n", axi_chan_name(chan));
 
 	return 0;

-- 
2.53.0

