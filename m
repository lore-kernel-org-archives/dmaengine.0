Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312994;
	b=i7yDxe/eiDOlrD5hF8lFdkJzzbFRAs1cELTIM3MJZ0lWmgA92gR1kJER4odqkMNBs67i
	 rWNmrug5Xyf06kIghwt1dQB6ne+kps+PEperf+mHIoffTGb4s4tKq9tLM5ot93brSuert
	 f75FV475ygB/bTltcgeqWMR5OUXfl3NemY3dzdtgp0Yc+gxWMcip+Oy3uM8q9eSeQVMcE
	 m6KXniVaIX8rIiEOA/0WxIB6HXWVIfKplVxbebsDri0Ss/jb6NoNxET+fZOgxwVxdLLbx
	 QG6IWk1auBelOwyRlOgsT08blvmW5UOt8Isi07KO+oRu0B+jJOow4IY0B1F2asBph+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=94WZMClHJfI/hK5hnDLaJYjY1fIJ24YVjNi0D7Blgz4=;
	b=MRFiKrxfC0h98Yd8FqIFNnzubFUqgw3NMiuifrqij+CQzSkqwNN9UvTIH62B9x0G/gcV
	 IA0px5haWZX41kPaKqqZHJ0DgjDkoQmPCWRmUof+gbcauB3aHJRmUt06h+RZAI1k0RGwq
	 7/bCXQbzys3fe/VLV/OfLFuqanrt2tyJve2ZXFmNbC7F6JKpJAFmRCXYKD40bEuLgI1Sn
	 bOQ9u0Eai3YFsnZAHU4FlsDvp0ZpUOd8n6spk9sV7sFTTei3ME2+LZwHZBhEGCUVly2Cn
	 DZTW41p8Lg9VgzgsbGCAVC6w3ORsgNH8f4QTmVcxT0V9uv+hcqenTFSDcRrK5dxye7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcfI8QcX;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70261606A330
	for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 22:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70261606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcfI8QcX
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-84a248254f4so122252a34.0
        for <dmaengine@vger.kernel.org>; Thu, 29 Oct 2026 15:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312993; x=1793917793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94WZMClHJfI/hK5hnDLaJYjY1fIJ24YVjNi0D7Blgz4=;
        b=JcfI8QcX0MkbuJpYSDzzNklIPIfn0nH7EJu8TYdFgebu+YQVrQhDw+mvk1wGbaKMGq
         xXY8+WzzD737OMw3GX0zgsKKqQ9YH4TuqEoT1YoDbARN6o1chKnJcJoPFErnm+vJ+FSm
         mZ9oUf/MyGxkQ7u9HVFZdxFYzHEVrB9+L31XZQKFeX/f1nZAj+yXbzHI+oWBCQBke45s
         ceFmyKnZfwWgN3YGJP+6huiuqz8HgijQwNUpOeyOEvATYJyRFxub0h0P59AjByjU3Sxg
         /sfcdJ/FPTo+xawFPEj749PiJlPbsg9E3yRB4iGMhZpW/uN7xGBhaqqoCq4yVJUqjKXs
         hntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312993; x=1793917793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94WZMClHJfI/hK5hnDLaJYjY1fIJ24YVjNi0D7Blgz4=;
        b=epdTvr0UU2VnqCLdlpySR0uGKxL08x/xQ+3rIuVibqFKv1L40ADX5/k9ZeKmdanRr0
         i2W+QQxA/k0h4ryYxsjwHcgaUuG2PEmGG9WQHTPcVe4QYyTlxFoa2lVAAdoilP77Khpi
         u3mxXZzabxcLNEZhWqfNaqwO4CeS2EbnbA1wl4cbCSIqHkSRIjj66F/0fRai+T2xsfmc
         Ge8kCp2p7QlX4HuPeyfolJm5JzNSxNFAY55vgF1AcbSaE81R81hv48fBZVwICxA5AaXM
         CQ2uy6pC/NwhGnIw5ZoINZbVyhfZCg+PB6tHCdZX4b2KXZDo9akx4C+L5FNU51OQijMB
         ypgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjkEPaBmHik8E/HRBPe3AfynbYGuA+VYABNqadT2dHL9+Z9U13ESFf/kzXZE4HkXk2ZzHXJ8Cl5Uk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLaHrx5KdOIHiJzBKxK5Ek/Wjf7yoNT5am6GnT+ccMGKU+WF3Ce
	7aiDX4SlvPBiidTqXq3rOn9LL+4KfXRcEDEKdX1PsTU43Ea4LXgJKw+l
X-Gm-Gg: AYBFou14NVQhS6SSKoDSXnhugyIM5gUWdGQpi1kWucU84mAwi83NMv0YGkK5y8M6ICm
	rvVv3JaGhsU/Z5BKdx/mlt97HT9m58DJkVIX521b00H7FPzZcOK2g+QscaLTDE3cu+ZfGGiS/9B
	SRnsG4W7rujRBqljE+0N/6Mn/UbBq1oAftiov2Ns1USr+V1Ukt6OUl20YHNCMiDOMhGQipFpR0S
	tBIUeNdZ9NhBACOSmPhjdUPhszZgcVtdwnq2zL655b5im3CIQ7KnMAEssFA2X/Tzz5Agivoptdb
	XsP9tyaFLVCOUG5v0GSlKXJUER+Gx2RBDWCkgJ+FAhARVkAGih18VdUeTgji1WfoUfAihaTXev6
	5d6cO/J28JWJ34Nza2Gzy3PZ2f75f4zqLeZ4BIASpIeEvfWqtv3dIxlMf4Uyce5nDPIMfUI8u0F
	gwlSASn2YncrDba+Xxa21wrNV1BBPTFcSI5ZiQEfbwDmB9RKWcfgwNnxzjrwaamYqAVGMssqqX0
	VsZpJeDbNgfBTh3gg25ikY5v8Xj2udIOhVsewwSQkw5P8sbeZfeegD4uNXmaAqKyWI6FFKr45cs
	uzUwmOarNAfiaUPfDm6tV6oARCyitoApF9mAbBx5Q79vdEOkIZVhEeuu+bwKX/8nxCVqFp+HJKF
	NcKGeXzgz0pev4SSgCcTG1+znL56tGRcCN1YWFhlqPUf95cszbQMJhFuX6S9jK8kDvrgun3IcqH
	XZKT6uI3Cfb4haBR4SbDqr4XcpbAw9GmF/QsxhiWDw6m702BwlP08X
X-Received: by 2002:a05:6808:1244:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5640deea651mr505285b6e.19.1793312993474;
        Thu, 29 Oct 2026 15:29:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 16:29:39 -0600
Subject: [PATCH v4 5/7] dmaengine: dw: drain the tasklet before releasing
 channel resources
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
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-5-fea447d9f285@gmail.com>
References: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
In-Reply-To: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
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

The controller tasklet invokes callbacks after dropping the channel lock.
Releasing a channel can therefore clear its configuration and disable the
controller while that tasklet run is still using them.

Disable the tasklet before clearing channel resources and re-enable it
after updating the controller's in-use mask. This waits for an executing
run while preserving pending schedules for the other channels. Have a
pending run return before accessing registers when the last channel has
already been released.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 1d6419e1cd3c..3bda85adbeee 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -398,6 +398,10 @@ static void dw_dma_tasklet(struct tasklet_struct *t)
 	u32 status_err;
 	unsigned int i;
 
+	/* Channel release may have drained a polled completion before this run. */
+	if (!dw->in_use)
+		return;
+
 	status_xfer = dma_readl(dw, RAW.XFER);
 	status_err = dma_readl(dw, RAW.ERROR);
 
@@ -1067,6 +1071,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	struct dw_dma		*dw = to_dw_dma(chan->device);
 	unsigned long		flags;
 
+	tasklet_disable(&dw->tasklet);
+
 	dev_dbg(chan2dev(chan), "%s: descs allocated=%u\n", __func__,
 			dwc->descs_allocated);
 
@@ -1092,6 +1098,8 @@ static void dwc_free_chan_resources(struct dma_chan *chan)
 	if (!dw->in_use)
 		do_dw_dma_off(dw);
 
+	tasklet_enable(&dw->tasklet);
+
 	dev_vdbg(chan2dev(chan), "%s: done\n", __func__);
 }
 

-- 
2.53.0

