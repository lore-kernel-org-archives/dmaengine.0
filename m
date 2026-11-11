Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794366921;
	b=ArF4zqWxrLt9yY2sx1IjUGFaAFA2H6PZZzDs/HhrsjlJLjcVxVZzWU1cgBPj9qGCZiOR
	 s9wzOTfJr39JLx/SDiRSaq3sm/Zz17Z6/5Bu8cXswPNxpCjjag+ysWZf6hu1Rgvrw/wAR
	 HzrRu23EaRr5sb8XTqdG1m3kRcjOQ3N43qtQ3IPmZIuaO6XTHIj4vg9guwL+Wu6XcVcDs
	 MpSQ5f+yuzZFrsElBAvNKAdZXqEco45idDLpom54AwsPdjwpotGi1f5OG9ZkxZeQD2ySl
	 Greugss8bOgnIiaWm3+mSUsLhrGmJsVX/dsl16XQAKBhnCP2jp4BbTiF9n/dXX34BHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794366921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=8XcBdNuRMoaATT6u8r4a89AF/r4EjhS8wcxyVTrRvag=;
	b=Joc/PlJMyHUnGM/K3d4q/B3UH5mRnnnQ7A9Fsz15H3lAfgw5YC8Qtraky5oLBUiRtXmp
	 oh/v5tRC2kKuYRm3c1AWheclQyrBuUNLbPxRN8/Gq/l/9/CrwiV2WgPQNozPR9BUQSaLh
	 KA8NC95PIEgB/h/pzLXSJKdKYMOYJcj+6ZP6MNvgblqWw52Wu08CmN51P2mMXBNcOJ9Yu
	 34aST/oRrCJ++Hyno+4fJnitLtaDd+uSS4NsMqZpkesTUdxPYmy7J2YT3SV62k49u8GbM
	 i87ikO2olz7gyiCvBv6dFyvl7laQvtXWTJKu/FY3k8gvsHHQOPoeFl1econsbLrEpHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5z5a6Ih;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC2360A260C
	for <dmaengine@vger.kernel.org>; Wed, 11 Nov 2026 03:15:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FC2360A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5z5a6Ih
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f699fe49b3so1863624b6e.3
        for <dmaengine@vger.kernel.org>; Tue, 10 Nov 2026 19:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794366920; x=1794971720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XcBdNuRMoaATT6u8r4a89AF/r4EjhS8wcxyVTrRvag=;
        b=Z5z5a6IhtHWs0lSoIePVq1kSkSmClUqbm8oKEoa6pn4/nKodNgvJ2ufjUnu3DaLn6j
         Gb5B/fKhn5BOM3BM9T+JBYHQ2y0oRPvvPGUUHG7qwpXc2slSdG5070NT7yflE/TObnGS
         d4iQIUSmQzQyIiE5uYGt8KM06wkb1aTSjyCc61Ja0gZVGsHERbJWWaxDx04V7YN1g1Gt
         TOKikNbAmPIYmlC8BoLjwp48gQZ6QKL4uoxJj5rHABmZwFApWg/ijgBwd0jUDmZzQDtl
         rn9AZOaI6zjYtrENcRzj5GhRHf6LKwNNgckiBf09+YqM8nj7JGDrlMjNEOicLILn2qtH
         7j2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794366920; x=1794971720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XcBdNuRMoaATT6u8r4a89AF/r4EjhS8wcxyVTrRvag=;
        b=r6qnWRvwB7do3G81u0VmqtvVYOcN2+F4CQFqd6IDk6h3qdqMThb/kOKhscqzQFId5b
         dwVtzAOOIUQlxdXmL5lEhcw+/VuJyyZT7sC7OkgONFAptLIW68cWStR4KqS02Nuo1uqA
         CU4VSmaoSwi7FPouBfLK6VTHFQA5q8+EuWm1TNKP3nBF/MwfPSn+lCWjOhLgRVJQhzd+
         orAesiN5b34Q30jHEzgzECbRaYoJhOkE5alQTjy5+1i+GPs3uNSScvCsy3QAwptHOCuM
         KNzeNfc70ekuPrfDyICIQiG1jP+QBeViFuZDEx6CiG6I7c7f2lsMmQwoUcWlBqRBjVD3
         A7/w==
X-Gm-Message-State: APuU4Z965C6A146NBPCd2PrvoXzkr1AZVsP0yUVmOlw+jNgTh01h+NUg
	BJs6ZJD8hGcKzqABWfQc9Sl4QhmIHHDV+m3cPAy17PcIIiPHdiyUbh8I
X-Gm-Gg: AYBFou3/otFoNULcPf8PayssqTwQ9LVKJgxP4/+vto0V4r5R1C5YkDLDbGt5ez/6dhU
	8ZxxuoLQJicIi5/l+uNqKPO+W8qkjKDmJAxcOMB7g/lrXo3RhDSWbGiVF3oaemAlwvUoqBMHWPd
	iijiv32xJAG5Gmvak8tqPLZYrXWwSEL4/UfuVeeHKs/ItHH4nDwTlUkHpEulYhUgGxQi7MvWZaF
	Mh3tzk6bO6YF3EHYbFbgS3yax4Owh4eB9FGFwLS9mFp49iPU5pZjiySc8Lx2Aqnc0l00CXzFix8
	nqU/54gXB+xKCw4TwQi/+VH3Z/Phwwfk80YgkmHO1Ye9xO6kHnFsd87s2DkuRY/3iYIrICqHupn
	cE+UTsozWIQMDvJweOyT6R5Hj2WImYTt1chEB+spAJrUQu3Xi7h2s3pnNKiu5kn685soXSHFLKy
	LCQ042dFkrItSOtCrJ71bnE4Puu4/7PSV1WHfy465gsztxf5EYN5mAox0zy+x8twLekSeJ/ZJzJ
	71L8W03fayxMS6qXUFCT4b1j3vvICPb/oZ1oGvsBRt4M69jU4Wl9vKo2f9MMFPZqxs15mbBJLxJ
	zRCys76NjgBMmjr66g3kVNQS1gDu4frrXtUfIEa4WxmtbXyeOMQE070GIMExTGJPfaqwzr0iMmv
	YCBP6XCRjYQjiKfo4rcPOxLNKfwwUatE6CN/sLsXbbSlvQNfg2a+rtIB6IIIDa72p0uRmab2zx/
	F04cgSachxcpJn/0lo44lkxsq/LO/8+lIIeferbwfccNQY0yzJDjLxz+utDIpKp0AaEcfyNYjT
X-Received: by 2002:a05:6808:191f:b0:4ed:7045:d3bc with SMTP id 5614622812f47-56b97507aebmr1037132b6e.32.1794366920529;
        Tue, 10 Nov 2026 19:15:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm3999345b6e.3.2026.11.10.19.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:15:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 20:15:14 -0700
Subject: [PATCH v3 3/4] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
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
Message-Id: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-3-35fdfba8b61d@gmail.com>
References: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
In-Reply-To: <20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use readx_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index a9a87589324d..bb305ab94d02 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1222,7 +1222,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1253,12 +1254,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
+					status, status & DWAXIDMAC_IRQ_SUSPENDED,
+					2, 40);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1266,7 +1264,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

