Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202050;
	b=lIHQfBrpylFyTdCMyr03KIRqY1otaebW3Cp5cxsqNWwi/AN6Vua7Q9iAc1wr83zK6QZ7
	 J9l4ecBud31fkMxS2p7dum5tXIY7cyqlZci2UnWr3ZoSlNzDEGMDKXQIhBgNVwNmKnF76
	 8BpORTcgwmRu6H104S6LaMeuzlXPHKrN34YylePsD35acapXhdn1YVOfIAjz+6wje9X/+
	 j5EPIAaYbi/H6euznBzqKiMg366lUrPVZf22aBemVBK/hfgHWNc4afjSF6ygh0qV1kA2N
	 DGEqC91UQaq9czUoyisnb5R2FoZs3LE9b+ONr/iXEwGO3Cipe6OL12NAHmPcgAmiYlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=kH04HZ+g7FuN8rIrCoSeymODfFw+CjKgbXOdba7zXjQ=;
	b=KrWAkhFMjyPho9rWP7gZ3/HpKHeUhwqL7H3G6xLujCMAY0NEJF8IwZrrTCKqUZrUSqh8
	 iD2JzLKoGECcchxYxrCW9zAeSLnPUQIXrVipgL0oIkYxcbJkIUUZOVdcqyrXLKgDHobqc
	 kbTPY3h+/XSwaX+rtsxEqS+qqZkQKoj/PPPKANKrMXSWmuRVg7V2wsMZxtvTayxb5SVD5
	 CAZkbh4BukH1b/dI4aynV8VrJs0RJWkW48MbDT6E20UOLTZeHN5TkDFg4AqhrgtzZKgiM
	 dDHfjTj6tNBTs5jhAn0bUwLsSXipjVl2LBzdhxGex6/R/U/VZoxzpCxcy4P5QlKnoLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7vfW7+8;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB30160A262B
	for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 19:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB30160A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7vfW7+8
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-85ac281604dso480962a34.0
        for <dmaengine@vger.kernel.org>; Fri, 20 Nov 2026 11:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202044; x=1795806844; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kH04HZ+g7FuN8rIrCoSeymODfFw+CjKgbXOdba7zXjQ=;
        b=C7vfW7+8ov6CR4LH5T798HdG63VmH7oZLjAxE8SMw6Hn7Whr1rXRIwFQsCEiXN2BDm
         pQ63JuuLR3D/sGewSyW7SB6MrEtkjNknnNvPjT3LsSQuGr1U5yJE2Ti5o3f+Sxo2Y1xb
         5vJjr1/k7ih/y+I30ute24tGbiUGOs2QElFq0PtFXwCmGPEyCTxz81tx9KIBScTRR4oj
         ES059hqxcOH8e7BiZjvImBWPOA2w1QJ0U02fC3zsUnTbrrlumg4k1JTCBvu+9K4ItOYc
         qw0A5lIv74B6fBzxG0LurIPVSeLuj6cYWJpd4yiH82q0k653qtWL95Zy/Zm6Q6ZNCCJJ
         BXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202044; x=1795806844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kH04HZ+g7FuN8rIrCoSeymODfFw+CjKgbXOdba7zXjQ=;
        b=R6UYUljv5viFdfjyo/13SN3uONDqofKkE+3iC9/FQfxp1i3lZnZuTYx5IqUQXpTfiJ
         2cGHJ0h9JmdCi1wgAbJCKak/HCzUXqD6EV4+49aLebiXuN4gDx1Atyjk6DqyYy6evOWH
         3WVLNqQCQo9oOedHpy2Oi5X3MPEqsWEa2k/sD/T5ra0ardrcqEYol+FhONbd3Bm7KneP
         2ibf+06BODhbi6rR6ES15QuI++Acnw9ZrZLzzsJubONrd218b6Yc/oUR5bHtpC6ldebZ
         iLv/D1D194ThHEEWyQveaAzb5CdnvJvESwoNURLDo8F15L4ou9a9vlthXxHLzkJKB1pJ
         h6rg==
X-Forwarded-Encrypted: i=1; AL+hErFPKEctJ3+bfIT6vebyE9ZZqH4cWnzdBG1Hkadkxb8CDJ2x53LiXNxjyrWIMfZbfFgPHLl0cTAx9E0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kS3+zN0ph517ovcWrcTwf/VUuo70ZLDRxavpl5T29ZF6ZM6ru
	dIkiWYgQsCMftcXdp67F0MTxxhpKML1axAlBGm2/wW3Eh/Kd87Dt1dJu
X-Gm-Gg: AYBFou1/6YuK1x3BAZGSwSkN0tHTgAzgbDg2Cg8jAF1aggYtvpXBPc1UBhog9DaUbm5
	W9zNK1bHzda43d0/THwiCXZfiQcuvQvey23DkESzOfX+9sl1N8INtn7KZcJavGprM86E1gmjtL5
	Eo/6gCDePmkjQLclYc+nxN/XNvDrOG89xY5mxkXo6cbrDTs+sI9287jBC5+uF1V45w41G1klugT
	byEXp3zTB6g22VPuSsSXZXITKdRaKFlJrl5QEJsf3J/e3kB5HfoOf05sqabHhh0iOJb/BVVYa76
	0ZbJHc+eYamrvkVUk+2vUqKQHSZsa0iNrr42391gxMdXrBTaeuByu3WkzRvWy9EuGw3+eS68OhP
	5ft5X2ZXIk7wBlo+p0CxA2jXDhYOyMMO9mWqOYjIM2Tp38lmcXnBH2V0BE1O1IXK8kpdZCwiwiG
	YDbWYGyn/NcK5KTUeBNooxOh+ag8l8R9QEEAG2dIMj59lE8YGz3BTbk5U51kI5gv/mnrSpy0g32
	iXZwHa8g7ZEqDo6/O7Gq5QlFsMXrGks1/jkn/N+BV0W5jH9j2K1r1NI0b4X9WzFLK0YaB6q29fI
	FEMn206YA4ZqDQ42qHAN2UnVUZykl+pYaqu0pDiIyMYZ/iyJledUO8LI91Y0z2zil0yezW9tI9I
	fwBgNYCY2gVRXawZ7gyz+9ps/NdbZrMYqdI67E8eMpyRGZfmLYP7YYlpvVUOBlabNgxgIOv9rgj
	4mPbVoWX7gogqPumNvF+QLqw2z5yaqtR8htb3uql1PxWRF2mZiJU6Saw==
X-Received: by 2002:a05:6830:6816:b0:862:c3f1:634c with SMTP id 46e09a7af769-86315a059cbmr4898655a34.25.1795202043790;
        Fri, 20 Nov 2026 11:14:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168f3964sm2654782a34.14.2026.11.20.11.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:14:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 12:13:54 -0700
Subject: [PATCH v9 4/9] dmaengine: dw-axi-dmac: use atomic polling for
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
Message-Id: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-4-48ab58961d6e@gmail.com>
References: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
In-Reply-To: <20261120-submit-dw-axi-dma-stop-pause-v1-v9-0-48ab58961d6e@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>, Baruch Siach <baruch@tkos.co.il>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use read_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index def591fc75ce..8c115d20728b 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = read_poll_timeout_atomic(axi_chan_irq_read, status,
+				       status & DWAXIDMAC_IRQ_SUSPENDED,
+				       2, 40, false, chan);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

