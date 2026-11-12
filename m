Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471787;
	b=FV2L+cf0mJ1bOgHYajx4PWqeGUZmyqzmOKFuiyYh/9TXLY9MUrnTLbLdOhCIkQ0KnJTN
	 L6revyWMkyezbb9tdV8RN27wlpWdd1bcm3TnTabkg5Fv3U5t4hI6woYHDlcffjuGZTRlg
	 eXsO40ieR0ygYSuR1/rgz+V9NMVgsau9KKdcnRsMAh3p6Q3hLIxZXJu+L+HQ7YcEous7M
	 /aBrjOyyWqqypTQk1uQfiRd4ywcdYhBvesjF3zLPgZruuvB3HLhcCyFrEf6ssfSSFuW8s
	 I0mIhhVFIecnjC0oXWvIxU+AHWj4Lg1yAiU7YH6R6zvejquUECDCHbBUVFgkY1WfTFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
	b=N2ju5R98oRDpT3+CcXUARq5g97ZygyMy7BO+dYs7Vt3Tz/gF2ET0nzOMzXr13ehHv9OB
	 CWbV62Du52tH9HQlk0z2fnEjlOtbpWRGyKJM+Ih9QBEFB9IFQAg1huuV0kOwHw1NVehyC
	 b04EqRLLWVbzWQ6TdvnUzI5GZt//mmIzSFZupYu7cZ/PBugSAKgJkq8uKKL/9y4c6v1vE
	 qa2ADO7VHMcSUQjBYKlmymVAZZ7MzTHGRt1z5N3jNXRFl5rV51cYDqd9n3ld8QK1zsRF3
	 c9KXYDrnDCpub6Oz3sfsn/DmRBrYn72lDGfhYpBkFdJgvx8YSUWdlW9nsD1a6nGdtiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFBgQacY;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38899606A8AE
	for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 08:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38899606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WFBgQacY
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-53a448f86e0so2250673b6e.1
        for <dmaengine@vger.kernel.org>; Thu, 12 Nov 2026 00:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471786; x=1795076586; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=WFBgQacY4SAYWRfsBSBaJ6s6QX4C9BAJ0aB8ds6qsiTOL5oDQPmfG59kRdjQvuUmwt
         /x6HX+86LluMIeu7fayNo+Fd4dt6Xa+sLBw3Ag8mU2O0I7kKUx00CkUOVSqFdJ6RoIl5
         hi6ySBXZiO7tbbDUloV3DoanZjjwmmTVXu+HR7MBMO+GfUxQW5+7zNwD62RrTaxPGCbM
         J52bzQek19rJmAFKiDSHndRguJ67IsXWUhCEw009QqtbquYGFUhNvX7GSSRxpsAfiqvm
         LpHGruBAnQxWETG6R8LGuDRFOhjHnv/bjhivshJQq9OKqp+3WXRNG9zmJDBqfwyflDde
         nxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471786; x=1795076586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=lIrmgo6/vRdWIjjxMzwxC4PcJwJ7EhnDY/D2u4wWFn1DpH4anB0M+BrkmUlSde2iX8
         7FZz4q/cjoPZSo5lfw/w3uqafNP571Gf3da9V+8zsoNAQ0Ya+t4ej4tNXuPVIPQPJK1R
         1QF0YzYE2qVoDVzx/GIPuofYmaNuRe1LvZqgSBWdxF3f3CR/uKakZpmh0LXhoZmsMxuq
         Wg/Jv2B3ZHKwCdmJw1V77zJBr8RaI0XMDvP7hryNwKILZNwQGL7rvAsT4xiHYr+khJBY
         vaVQTD5AiAL2iN1QZy/0tFfzP0xLGiQuN1W5Z3JXn+4flqi9AJWPWZ1aEKvy5Rea8BVr
         LzMQ==
X-Gm-Message-State: APuU4Z8fxXI4DjjLZVa6OopeXO2NPeDuLU9pxTjrcpmD95viTGhnzE3O
	tsXhG/0GefFJ0ov6NACFAYuWFfNrqmtTZH1exu19N/WQQasMv3xd9y80
X-Gm-Gg: AYBFou322pFF14KWGPhOUXY+AA6IQQ1hQ06FmnnU1MHlxKR7/qDHMYKrhDhrvf/d+lp
	21Nk2U4tNP2zaR5QBZIi2mJWhCAx+6KNkLNXf+KxMHPcystMZNfk4FMMkqWd3i/20wbrtYKT/yc
	hiZswXh5H1XN5FMqT6PQc68NN5RSOgZU6lu0GFc8CmhAeU5N6aWnNkexrOdzy7zrJkTy4Tpa9s+
	NwKHJV3jKIjWybN8r0jIeJPhu/SbtL8kVVTb/QlCYMQka5zfGSr2uNBrQMLa9zCbQofr4fDSAZG
	2SUjFAlSizrCFfVP/6ievaiFLuZx2ezZu9eCziI9cpwAMpT4rYFBvQAnqGV5TZ3CWFOkgw8TrMd
	fRYyUUzfa64U4x3FUBc0e1j1Q9gpjxeOg/17gNKOe2wF7tvQKuiXn/trs10f8HdE+/5U7tJ5/qN
	YCQP00ZMiXjA6kD1j9vFGBL56LwE3t1w5gY0fVWM8tUBBKXeg0292FLbkQfZPpMmKvsSWxEfv9A
	AGx4ukfJkQf/uCK7E2SGe6X+ST7CIEY0TjCFVQ1deEncXqv7SJVu133jihsFr+Ac1KMFtTnTkoV
	dlyXwpcpaq36cd4nvMhiFn5YVPPaS1t2Rh8crdSA8YE2ldLy5eGlEuKPrhZcYPk++D9uPCG2Tdl
	dyl0GHZNkLSawaDZ64OTxvBNSm37OvL8iAR9hJpsAyZkjA+IEIlVaYZhljmZ5mhqnzt+ZFE3gTP
	vg1vl0+Z0KDBYL4zUEJHQtg4EWCUHqdtY8YBW6RhDGyHs2B/ynJ09u
X-Received: by 2002:a05:6809:24a:10b0:56b:220d:cc5d with SMTP id 5614622812f47-56b961943b0mr3378225b6e.10.1794471786165;
        Thu, 12 Nov 2026 00:23:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:52 -0700
Subject: [PATCH v4 3/5] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-3-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 405ab9a78955..040c12d07db2 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1185,22 +1185,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);

-- 
2.53.0

