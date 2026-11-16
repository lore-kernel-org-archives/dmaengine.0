Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808882;
	b=raj6Zpd5Bjwtq992YzqCFhh62kAB5zv9z24i/40oaaS7sjhwWq+izXoaFPzcVwDE4/7p
	 oBfD7XKISNVPAvAns4gN5ordBM4O6qRg/DvUDtUMmkLdoHbdwB9n/Xx5UUb7o7w7YoeJw
	 m/1RiPMZGPnrj7xHro7BxeZ6MuAmasbgVeyObz79HXYjZTO43/QRxnfBjRrjX8Qaa0pWB
	 4KOnQguOWGYQGqLy7YXgrOfRyTAs/r1Sc/HaRFqxLZGBuu+PPuIdKBmiEo1VgAVh6+RET
	 y4WyOdUfDPKl1DzDiR4rKHxA1lREq17Uv0IcsEOpo+HZGG62LkTy2F9fG5qLVPNTJZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808882;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
	b=AhkExCkjdBMqxjHLXk0rMdlk74TVN4rpzZIC21D0kXW1UhL+7CI7qkJTduKYKOYVk3pl
	 5r0y0mj84Z5fWXMrUEuErrXYROUGoHPNnOaoI4oJkcHw799tvhp3M439H147qC6p78bRp
	 FWIqvh29VSX9+4BHnQtMi4/t4v7A3M+1BtOqF+6sK7z/U9wD6o1kLO63eAksBdf8R6VfG
	 79OeCsy01NBGgTI7gvMSgJBcrH4ruRTCpWwbY2SQQ7MO4qiR8e8wS+ik5YYNexb3uS/Jx
	 V2NXVf4QchA0mAU8iKpN1guMtvO6adsIaPWpmi9W7nxY9zOg60AdESN0I+AxMUGeiAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx56x4fZ;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A08606A896
	for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 06:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A08606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xx56x4fZ
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f48c750afcso2497218a34.0
        for <dmaengine@vger.kernel.org>; Sun, 15 Nov 2026 22:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808881; x=1795413681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=Xx56x4fZHENreaibOQJxd3BcFbCwzQM/QbbLPcvvbQHwFUJtXrD/LVH8ONfHv8yQ3t
         PbBGA+bbkNVy+7coQQFSg/akw05l59WvVDM2sSM48LZyb6VmWep/6ikll1KNtSSBFIiH
         SeP3BqZatpaDMuOEHrNb6IFKI0Gdmw4ZBrVeVzR0yAxljB3vhokVxTx23LhGOfr42Szo
         mFqqiUeGW1e6KhRMOq8lr+KkU3nZ1CT+LuZ0FB0EQQ4xmdb5QTiQailRQ3KFZlFVbh4I
         /LT9g+1IfwXpNgx/cW5ICCKBssPi88WYjS4yMXAw35D/N2Qr+Dzo3u7XekuiI6oRRkM9
         wtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808881; x=1795413681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=gukaTo1NAVPv4JZSaDvabn4g350WtHqrUwed3E5MOYtSOO0yvY/AS0Ld0/pZddLEpM
         GGTRh4ByvVxQY7+GJ881bMBb3iPlRzaM3NlAPL5BK+JRV/ClYnOKUanq2kUo6mVj94Gn
         SNf7OP73A8lItdCNir5LHA01j4LbFA/tRYP1RWlkaTO7InM2COTi4Nx9EYXV+ok0ba8h
         yhozD0pJdTJFeDLNv0s1n0APcrYDC44UjpAhri5tqohlRfw4hs5yGVNDbwHP1mSWj1R0
         NmB53pVYBQo9BZI5t74YeXpgmIKAbJbfnie8toKC8EVg1nfRswY0layZ+FESVKy2IhEf
         Ga5A==
X-Forwarded-Encrypted: i=1; AL+hErE5KzyGmQPU03uQkao3nOZ1LbtQJv4Kfen1kacsjo+iKijCwj3O5VCaA3cNYR9fK3oT6mZVzkEMlbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KojBxLz3nQ++OfgBbQcfFTQSAncDJPCM836pGOLFcj10NGVgh
	mVUvvejqLZSej8RAk1MLr/2bwOwO+v/fkbga6BORSOkbtQC/Msj4XyAp
X-Gm-Gg: AYBFou2WtVs1dTI24SO1s3YANcf00zJeVLm4oLNDLUdOni4YEj3n8hopEXFRhEDEnfm
	byLNDv7ljpgF9I7/kMrAmvThciSzIK2WGCTEbWrGLVN6f8H3MMOL7xI+AOt4k7Xll8z76moCXeN
	4Y+x3wquA7gcKUsvSCWRUFX/frg/y1hbjIyn/Jw0mw1zD2AuJkQ8I+OvT27KlQcFL8qAcF6ZoAG
	XzkiiOZyLfKWCS5xhBoEXIBK5EFAZMCrX+cuVK6VYP0tF/LLdKXyhztc3gn0WTGc09xd+m+SdPE
	It+znbFJhTK6NgqeIHjnHN6ndl5IDIImR3A85uYv/uVGLET8IM4acjTZWlBTTx2vnSy2YyX4lPD
	NdTZcC964HuoztpCPktM7l/PMJa7m7k/qd0qk9tQDWKZ+n0WxR9Kkr6swPvHQcLMWJD/KAVJYfk
	31QXHyH1xdSN/dwYYVmZanzGB8UFtEEymfSGRTc4+XHUP+ekQVLSsssjJenQh0Pvc27ZbIpr/0a
	pyroF4hyzi4X5kp/JEbTV5GmUBhTVduEeTWhiYxTrN0UnimNjSgMjapvVQPevqTKwlBHaG1DGQK
	/CO5FEKV0J+BLJmEsqBEOdBg0hr6WtfoylYzp7csjh0/aQNBppGntVw/WgxoqfQ7EF1j/bUTW/j
	KvGaYtqe4yMEv5L/f0HsewYyoM3MUCQh1XtYY6nOH4Tnna3cPopxyqP6otWKPj+ZucrDwi1SBLh
	2MBYaa4kmKBjweD1/HXUY0VD2ruRJdFNWZBE6JblP7V3g/K80obhQ=
X-Received: by 2002:a05:6830:2e11:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-8628980b3demr10326540a34.6.1794808881474;
        Sun, 15 Nov 2026 22:01:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:00:44 -0700
Subject: [PATCH v6 3/7] dmaengine: dw-axi-dmac: retain descriptors when
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
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-3-bcb23d1e7029@gmail.com>
References: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
In-Reply-To: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.17-dev

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

