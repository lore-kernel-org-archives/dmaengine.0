Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A108B43550C
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385532; cv=none; b=GGH0Z5JN70DpdOeyg0hHH6JlJ+ia5HL2vbaK2dCXl0f8R6BKBwy4tG9d1XUOR0AQrE6XEgueMLrflT4r3n8RVkxhlVpfUnqsqjJELEvHNxCa738s5O3e7feptfjaER5dROPKEsJWYCBDn0HXE14JSozQS48fsx3PEqb7lyxsMfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385532; c=relaxed/simple;
	bh=iDQocSIDsAlV/ALE+AarkKKauy6yJDgGIKOSWbkIszs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6TMEElPJMUTBKBHsLtPEvNzHI1ylGMVlNCThp1K77wAUBdYqGuOVp11I5ewkfCAC//yiXj8SWY3yjoJTpM7WUwvKIw6khjirhdNb8gV+IUpsjurbpmpqeJg2gUMSHBzgfYf7XusM0jQsWsWjnTCHvHPvRSNxdnCi7TO29oUbms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQx4U5rf; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQx4U5rf"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39266382df6so2372017a91.3
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385531; x=1786990331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1heC4kdbiOKopjs0B6gQi+UwOdRbZzbCNzgmPlgldM=;
        b=QQx4U5rfhv/DON+PcHuzsZvmTxTDzBdwB8u1LFFQSiLRHI0jlggLfFSOgE4XwNIP9/
         rIQGKHK6E+62UxqWYnccX1boo47am+5rnm+PI5noXLrAgePkcuG9j8Est1mHlzIbajRm
         vNwT1fb2HgmBDF6YmumV5gSg5bnMc5Yvx8/avWhgPkmeKRe39wYwPh9zT1enx5qQfn+8
         2xc2pnXP7a6deKc1u8rIztPmb7I13trQz5BJpEweUNCn/kWiBvrY0r6zxn03qIzCppSz
         lXlPhzxlA2P6lHcVTjYkRvOqY/u+dqQYKnE+TpVhZdjCpgk3GwgScBmpVqcEo73DiKGL
         UBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385531; x=1786990331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1heC4kdbiOKopjs0B6gQi+UwOdRbZzbCNzgmPlgldM=;
        b=fBV0DpIFtyQzm1q95FwTXnoKPm9jyRSd20Fc1dkKXieSh5zmWeJVs8oI8Jkp5HWoST
         QWfczJjNVoymtr8KxvCXTDJG1AaJxl8gNziAx4GO0MwGWmqHefgyTIGNoINJ03tENJok
         iqK5NA49lSe89Lb3N3uMVRB5vTpslYSJDok+88xIHaEmUdnq65kGmohTMoIvJS1PWnnp
         8uYLh2RcBedC8GK3kVRmZMZ3HOTJ4dcUabCkRRWybHXQ4QhQT9cPskMdgLKy6QOIie5K
         3N7WFaxSENwCrwjb2JcYiiE2oYk7rZabeEAyKIK8FKBEveYejejBziSL04YRY9NMroiF
         NHQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0U5gV6eZYmHT6Bq6zP2U0gZ7hW5d4XTepTWhnoO48TIsQf4j5j2nNjNsaFk79XRxhrFuF0f4Aafg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8SpHOTZ+dvAWoLgecanQa3B/NLDKkzRxYeoWlvrVzTFcN9dnQ
	24029YKiA2B/9fwLo8n4yr3EJcJNMSZ2j/tn4RG9Y7Q3rTzPcnItCu8K
X-Gm-Gg: AR+sD128IlJAOtN0GqZx1ALwAKYJzBQosfcXllY4Vx+VJFjuxZPhQ43zc60UwpRnf5j
	PHp3zRAwlW6W4K7haxzYuMHMRYHLsrO1VKBeZCdBNqZyi+LoVUb+Nfem324L1rS6xA/897bnVzP
	4zyrTg5IbyMXA7FhloHTECcQtcFj4IoCr8O/c2DnxiFgp+/bDkzqTm3bvszhmGGwuogsvBfurCS
	5AAzU0ScH7TpuRxzx1j5uT0XgkYjZTQc3qSG90iCdBAa97/ULAbS007+GZQ9Q1iuwVRurdl1Q60
	POzAybwvl1ZN7HVsYYLQiGlvLArdexIs/DmEXlQMfHqwlM9C2UwNheylsMeELlV7OQ4ZoQB1J5m
	/o0QZISjbB0YYISZa+c7asy6Feg1HQJLFwTF/TCqzk1PLR2MZrYDm75enrMfNwCBGqTaIHsE43W
	VmfuHV6rh/VIg1pMvx+2VNzYp3zgMXjyPsRxTTAY3/79fF+EvTHtTWDMkfc5Bghfo=
X-Received: by 2002:a17:90b:3806:b0:38e:7080:b4c0 with SMTP id 98e67ed59e1d1-3903c5cfbccmr42496378a91.10.1786385531037;
        Mon, 10 Aug 2026 11:12:11 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:10 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 13/34] dmaengine: mxs-dma: use dmaengine BH scheduling
Date: Mon, 10 Aug 2026 11:09:14 -0700
Message-ID: <3dec314c8878181bbf9bd8bdf6d222c435643fc0.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/mxs-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/mxs-dma.c b/drivers/dma/mxs-dma.c
index 7acb3d29dad3..149ac402f7b4 100644
--- a/drivers/dma/mxs-dma.c
+++ b/drivers/dma/mxs-dma.c
@@ -109,7 +109,6 @@ struct mxs_dma_chan {
 	struct mxs_dma_engine		*mxs_dma;
 	struct dma_chan			chan;
 	struct dma_async_tx_descriptor	desc;
-	struct tasklet_struct		tasklet;
 	unsigned int			chan_irq;
 	struct mxs_dma_ccw		*ccw;
 	dma_addr_t			ccw_phys;
@@ -300,9 +299,9 @@ static dma_cookie_t mxs_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	return dma_cookie_assign(tx);
 }
 
-static void mxs_dma_tasklet(struct tasklet_struct *t)
+static void mxs_dma_tasklet(struct dma_chan *chan)
 {
-	struct mxs_dma_chan *mxs_chan = from_tasklet(mxs_chan, t, tasklet);
+	struct mxs_dma_chan *mxs_chan = to_mxs_dma_chan(chan);
 
 	dmaengine_desc_get_callback_invoke(&mxs_chan->desc, NULL);
 }
@@ -386,8 +385,8 @@ static irqreturn_t mxs_dma_int_handler(int irq, void *dev_id)
 		dma_cookie_complete(&mxs_chan->desc);
 	}
 
-	/* schedule tasklet on this channel */
-	tasklet_schedule(&mxs_chan->tasklet);
+	/* schedule BH on this channel */
+	dmaengine_schedule_bh(&mxs_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -781,7 +780,7 @@ static int mxs_dma_probe(struct platform_device *pdev)
 		mxs_chan->chan.device = &mxs_dma->dma_device;
 		dma_cookie_init(&mxs_chan->chan);
 
-		tasklet_setup(&mxs_chan->tasklet, mxs_dma_tasklet);
+		dmaengine_init_bh(&mxs_chan->chan, mxs_dma_tasklet);
 
 
 		/* Add the channel to mxs_chan list */
-- 
2.43.0

