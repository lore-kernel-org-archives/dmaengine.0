Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794813035;
	b=SYFS+zkHq38LKdkdHYBqyK5Xw/RV3SsCIf6/8PcyI30AiH0jL/868LHjxSQRFZbwhiE5
	 SjOkHm/lhH+9sKe4sRgMqXrRjg22XfovoPfG4QXeiVqZY0DZEWl/PpmbjQK15ZMY5QXeL
	 IdqjlOqW9BRpmTPUP7sFJvUiwX+FIIzTOO//bj8r45FXNsRFbjZOLLGs+G+Xs8mUn8s3T
	 aY5g/13wFm3o5ZVROJvnDxjGwzLszstwidLlXp00Q/B5r6NQ+XkHlWdpj00GBBnE65ivD
	 cNQ8WWh721MEh4WIPc7+XRPVp4A3hMDxvixeQvRQSEy8iC8AfSU/Lq3ru4AlMkmabBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
	b=fLviCDTDXFJ2csitSHuQESX2isOOjUIu29QhUnY4XRRIZQx2cpSd3x5sZnx3dOsnQ3yf
	 EFzuP9EtXHF4UiuL1Joe7H9XpbUY+emXIIbqQFbeCGDWTEvWtraiN4llqI7+yw9Y7RqOe
	 lm39Jzq8VNZc7smCOTvav7fIXZW0dYT8vlFJhznMMyGwljf1sre5bdtYp6hqSptDkCTHe
	 olZ7nx52U0M8DjIN9gVEMMtsIHRNoE563j++aKL17kJJENb0o87l+eUA1OLYDkdDc8ezX
	 upz/MLbEKA2GNq2rZMKxeg4Ei0CYh5Rif9LY6fFhaFSSh1JyW0uTFP2n066A/pEzYug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nullptr.com;
	spf=pass smtp.mailfrom=nullptr.com;
	dkim=pass header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b="UMFG0/hM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CF4606A331
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 07:10:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69CF4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nullptr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nullptr.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nullptr.com header.i=@nullptr.com header.a=rsa-sha256 header.s=google header.b=UMFG0/hM
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-67da3d03263so970419d50.1
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 23:10:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794813033; cv=none;
        d=google.com; s=arc-20260327;
        b=TivT0fc5HPooLps6l2iXRFCXvGOxUUrs4jKfO/mU4K+5Aoq0cOK7BdlSrhgh8lIk4Z
         vEB4XHkKk8f+MwUkO3gFUvaEQDQrcVYGJa/lBbLf/wAu8d86YEMVpe1PHSLVv+vYXxcs
         bcNKt0VWkDxuulo2NBW2rrL3ZWYNMhj0AenqDUuFml3sQKk8XkSxyQtxVtJXCFvpXOf9
         Z1JkFTQyag/U6/SV8VfY0b/mNXUAC88dCjxTdctujGKbAlmMpYbva3hoYWnbaIz+V+al
         rWTYBZ/dsoD/OJBBamNyhaJLLeG3WKgt+Fq3F3OI13CH7//RJT1k8MvBhvU4o7Zh8w4g
         B/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
        fh=LrM3G6RcmBZ425pLRY8E44TM1XcCb9gU9D3viVl1X8E=;
        b=XYW4PWUTdG/BFGiIndwlg+pE2+qgpUqBz6gmPDgn/DMPoc0axjmp5amfzcMtoXMTQP
         BpfoB7D99miC0C8eFYxDDN5pHtCgtRZJcnroSvrnsm+6xQ4YBE5VZjRNxrQ57Q2EgZvA
         Buk+d97VaoZDClmZawAFop2u55zTptk/r74rp03IHNqa74mmBPTogXAmSAn9XJt9Lug/
         d8VlxJ8/8y4OP4Kx9W7asywPTlrHDY6vftHbL0sD9S1EqavkGXlbTsXjN6LckvMZa8Jk
         lxBNkhz4ex360zzy2vTQW+ig2GY/bB0CeoYARG3VPg1/zB8453KkdRsQj/y9ULD3hcjV
         fqqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nullptr.com; s=google; t=1794813033; x=1795417833; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
        b=UMFG0/hMfEcDtAn8nzViWShFERh3qHUJGVHjaj9LUtu7cnSszzuJp8jPxlHhR0HVXE
         34p38yrea8JNczS85oXtIQfdtGGNUZf5AJYY3T5zCsp13ADagGlb4KMpBuR3+vmsbop2
         rF5jA2t2P5k85e/rW/NA9MgTVce/V0CaK0dtsLhYwLOYpao9xIU9AtUaoPjQbLkCj9a2
         LJpi0HRerjA/Du8FEdEWJ+9SiuUH39/7QSdwq0Y+Jos6yE7TAZWJBo6Ap/W1aL9mGiBS
         orZ9u0TMJvhhalHkGO9+Lh7HXPKjkRG8FCfS2X2YFCUkFEtyz3nCad2+27Pka15mi6Rk
         0dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813033; x=1795417833;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1sV36HcIIaexN1B9podEt8/JDaUKlNNQEN8NLfUeS2s=;
        b=tsFTPbjZLiZlw0QF7iuhQqF4c8sC07k389yExHN9lq1660H4+iY9u4gaaz8JdcZwt5
         eV+nOQD3OedPikB7nS/r4uaNmjU8qGZ6zYvwly+iU15YSDYzjn/EuqnUbxBU1Pt8xSzZ
         VkqTlK0qoqpJ1ZQ1x5AYIYT2TitcmZxxk2kgmp06aWk6t9sfimeW8hkmPs7xhPYiixQe
         MOvMTNdtuqfz009NIawbcott9YNGz0velKyk6DQfVG/EmGQhtFWYbbSupu9OQ9ljiFVB
         bE/o1t67AG8hplOuPKSZ2a5D410z7GAC8QT4ugiuOftni9Fe/8FRhs3kBrVzkqzBifdG
         j5jw==
X-Gm-Message-State: APuU4Z9mSzyQMxL6/TD7KeHqMjWkIgWedZgl0xl52l7NjnocGslATsBU
	qnJBONE5sxYQaK5jFjSk5C6LwT1ZmuH9v63xRrHcB+JB50261b0czhwbB9VyDb72sNRcU7mwZfr
	jY5q/t/prjX+5dRk3b2mtQJU7t2QbR/pLuputsnkrQg==
X-Gm-Gg: AZFdTZe7EOX36ytQ5beC9rva4OAo+b6cxEwyCYaw9KOBu+RbF5ElmhLA5IhF2CUHzyT
	ph94SpWRW8H1uxZaR8Cf4LIhiOqa8ONK6eITxlWGKvAoQktToVpsIjGIHyIKWTq3+gwIO2mnBMg
	3M7y83XssazJpyL9cj+bejdDWU1SziV5hfI+jn4ygVkhvMZBOCsMtVH5+uToxfuMPy70JHrrLzt
	20ykPPZG2M7/o1gG1+0sLPZJZdKz6AyBHfi04ionkvFDQMfOGzAEHEeTB2w+HR/ojOmAik3JYBV
	m78PHWhiBycIZbYZorAWp0khxVxaHNTuW9/QrNxT/DYomUaRNrjmy1wnFQ942AsPoRWvSR7dzts
	eYvR78qKp74+krA9Box+Yx90RIHfqGMbuM+hujBzg+kHNErxf0Cu/JaYv2OSyvLZ1Snibmwso6U
	z1xQxjJbZpbTx+TWzP2ZuJS9PjEBR1r3Rzf2WO5I4fNBO0BY7jgJx1JB0=
X-Received: by 2002:a05:690e:47da:20b0:67b:f42b:a404 with SMTP id
 956f58d0204a3-67d89639458mr3249122d50.55.1794813032614; Sun, 15 Nov 2026
 23:10:32 -0800 (PST)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-xilinx-dma-work-v2-0-681ed00c15a1@nullptr.com>
 <20261115-xilinx-dma-work-v2-3-681ed00c15a1@nullptr.com> <sashiko-outbox-216160@kernel.org>
In-Reply-To: <sashiko-outbox-216160@kernel.org>
From: "Jeff C. Jensen" <kernel@nullptr.com>
Date: Sun, 15 Nov 2026 23:10:19 -0800
X-Gm-Features: AclHuK-OOF8rUc0S5lk4SEf84UXEwuciSxAHkqIc_dTegknzKLQvIqLjK7DEKzM
Message-ID: <CAHnw2U=mQkQiSLgEGbVfPTf6suaQQiq7GavziJQEhxTV_CwyQw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dmaengine: xilinx_dma: Allocate AXI DMA segments
 in ring order
To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 04:07:02 +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Does the chan->err path leak desc and its reserved segments when
> xilinx_dma_chan_reset() fails, or allow a concurrent submission to race
> when chan->lock is dropped?
>
> If xilinx_dma_chan_reset() returns an error, xilinx_dma_tx_submit()
> returns without calling xilinx_dma_cancel_tx_descriptor(chan, desc),
> leaking desc, leaving its bits set in chan->seg_used, and leaving
> chan->seg_next advanced.

My read of the code seems to confirm this. It would predate this series.
Prior to this series, a failed reset in xilinx_dma_tx_submit() returned
without freeing the descriptor, and its segments never went back on the
free list, which put the list out of ring order. With patch 3 the leak
blocks the channel instead: the leaked segments stay marked in
chan->seg_used, and once chan->seg_next wraps around to them every later
reservation fails, so the channel accepts no more transfers until its
resources are freed and allocated again.

Will fix in v3, which should be a small fix. A failed reset cancels the
descriptor under chan->lock, as the busy cyclic path does, which frees
desc, clears its bits in chan->seg_used and rewinds chan->seg_next. This
only releases a descriptor the driver rejected; what the engine does
after a reset timeout stays out of scope.

> Even when the reset succeeds, dropping chan->lock after desc has reserved
> its ring positions lets a second caller prepare and submit a newer
> descriptor (or set chan->cyclic) before this thread re-acquires
> chan->lock, queuing the two descriptors in chan->pending_list out of ring
> order:

[...]

I don't think this can happen, for the same reason as on v1 5/5: patch 3
requires a descriptor to be submitted, or its rejection handled, before
the next one is prepared on the channel, and xilinx_dma_tx_submit()
documents it. dmaengine's client.rst already asks for prep and submit to
be closely paired. The window isn't specific to the reset either. A
descriptor reserves its segments in prep and is queued in submit, so a
second preparation in between would queue out of order on any path.
The chan->cyclic variant needs the same overlap: a cyclic descriptor
submitted in that window would also have been prepared before desc was
submitted. Before this series the cyclic check and the reset ran without
chan->lock at all. The lock can't be held across the reset, since
xilinx_dma_reset() polls for up to a second with
readl_poll_timeout_atomic().

-Jeff
