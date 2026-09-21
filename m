Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1A51DDF2
	for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 22:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790029550; cv=none; b=i6uNLc7GBC1LDWVV2EPWnp2rO/h5SoUfoqQI1Gwv2Z1lSCIkJmUfHuziAYT6Vg89nB/BqrCFEPI8y/1ayoTz9Xd9vIJYL7U48FbbVlnPA3C3zb0kPgI2iMkjtB+x+m0MJ5LwYnyaUr8z+rr4atZU+g/Nq+obMDT7q8fpyBYOn30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790029550; c=relaxed/simple;
	bh=ppfiKvwRFb3MsV+DdIeNcTDxiyrekIDHGHyJAgdAWnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WQYtMTYJ9ulc5lSVvvzdtx7x/A+Y5XnyKwCv5ewmZpc3t1FXwIoBqV1TiKEGj381mphIYM4NLDc5KXG4szx8ucuTshDylU2f6/ObzhPBvbD15HVmgFsK+wCbtkYlx5vzgwA75RTGQha6AMaQ5/PufLSioJFMSf0X5xn66aGmjZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5AptC+F; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5AptC+F"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso3349392a91.3
        for <dmaengine@vger.kernel.org>; Mon, 21 Sep 2026 15:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790029548; x=1790634348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wtx8XxjWiahHO9saGrrA8bVtKn979Y+PzPTB5vfUlfs=;
        b=F5AptC+FXwwyvr/Jly9RSBRDEJq0bjfnuweoqoHH6MQjBLZbumla23BMh4QJL6m76f
         hJ9QjY05ORXh7f/gQxVzKSyAKD8rOSyselm7L5myBgPl1YbR1Zvcf44pfVvQQcHn5s6s
         v6Rk3j6jP6CoePB21++G4RVH9J2pMQxmsnm30dnE63yQA5FWD/MkR8GkdQFYL6XxTio2
         0P6jycYmsmtewuzpfkUcH8/QS/9hyxjQU2gE1CvXWZa/fE6Rbt9ltdBdPf98lzfwVnAT
         4LvSnXWeEXmFt4IEOFXQ/Ppv7TajZqd4MQafo7Nz/2bRMNTbD9BVW/JTRr6kjwETtrrX
         kW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029548; x=1790634348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wtx8XxjWiahHO9saGrrA8bVtKn979Y+PzPTB5vfUlfs=;
        b=J391jE8rb0QfLp0Bev8drWSw4ZhfChC6lHX7WAGNu3p/voxqP9bjYMTRyyPjoPaJ4I
         FkMTwjjsO6pFOKqC6e5HRJcNGNZG9aWpQL2Gbma3i3d3oouKyoJGetK5uhuWNEQHSZMr
         eNA/73jz5gt66Brr5CUH1hIREpdGUsbN/UJ0XiQ7p6vudROxpfzqPf0DuZIRYb/JhXMw
         iiuaJRYstmkuJTqFZCPKH1JxpuhIHky53uJRf7N8GNlZR01Ao5xjKvgwMUkjAW/Urmep
         8YTSTpEDUYS1yuAyOwI0+ftyhEbmtM2OuiovJE1DHt4R881CS+M3qfH+se1tFHqGu8ks
         3log==
X-Gm-Message-State: AFuF++l1ktMiCLNS1UF23i6RXfXjGL3VQsMSJVnItIvsyhLl1jz4HhU/
	yqIjcqKoEi1xqN69A13aUpFHWGt7XQvlqo5T2cDoxJ+8Ah/MIlKbDwjSJQ2LRQ==
X-Gm-Gg: AYBFou3Wm+xsdtxDgGoMW8QZLEphTDzLuGjCeu5nd1zayiJQF4sD96E56YmfnxVOVfC
	HeAc5PSu/p7qCxZ7wHPb1lzc6ZnxsddQfyBk2v1qgeXvT9F33DhmVylP/bRVsmNkMrDmJ6S9qn7
	56Vsm+osYL8e+JKwSS1V96BgKdhuUMWlvZJ/HbtGKwX/2s91XiDGwQgA9mGIjSxy1ya/cdAcd36
	DbaeTSY1BMwMlzjrlBYItLIc7gRxCYsJuPuUoQpxXoYjRk3T1gErLosrTTqShYxFScwU8W5+hkJ
	9dHAiuARosm8Gm/JiyFTV9vOL8UalH4L5NoQXlVYXETLNZaZGUOEuN2kHknVt8Dzhe+A5ZgVc/r
	HAuNEgpVB7C7MKhIIgYTsITrvZfjfRQYF2msS36gI0XSimVbNnr6jnGF67jmP9CLBcb3++r14Mr
	AXTeBm96vqC9m81Bla+jyAEvCQVvTDTCw2ML2rkeJfjK8Um34u8F/KrgTM8H+7innpnMAH6vuh5
	T5QUYIRPxgWUdOhgruISZVaw/G6T3PPuRyD1HEMitAChXNxWb7xaWJZUllL2/L8mvgriRO+/uQJ
	9b5gLjVR1QyFdXWEYRaz/eX33fC1c0TDYwV5hV7WrqX7yhaX
X-Received: by 2002:a17:90b:3c05:b0:39e:218c:d47c with SMTP id 98e67ed59e1d1-39e54f42eddmr21948184a91.9.1790029547598;
        Mon, 21 Sep 2026 15:25:47 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06cb7dacfsm12607a91.4.2026.09.21.15.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:25:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv8] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Mon, 21 Sep 2026 15:25:44 -0700
Message-ID: <20260921222544.52655-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_re_probe() ignores the return value of fsl_re_chan_probe() and
unconditionally increments total_chans. When a channel fails to probe
(for example, an IRQ mapping failure) its re_jrs[] slot is left NULL, yet
total_chans still advances, so fsl_re_remove_chan() later dereferences the
NULL pointer during device removal.

Check return value and only count successfully probed channels, and guard
fsl_re_remove() against NULL entries.

Fixes: ad80da658bbc ("dmaengine: Driver support for FSL RaidEngine device.")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v8: handle channel unwinding in fsl_re_probe
 v7: handle differently based on sashiko review
 v6: increment ridx before continue;
 v5: put some stuff on one line for easier readability.
 v4: use break;
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 67 ++++++++++++++++++++++++++++++------------
 1 file changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..a8f448f69586 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -687,7 +687,6 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 		goto err_free;
 	}
 
-	re_priv->re_jrs[q] = chan;
 	chan->chan.device = dma_dev;
 	chan->chan.private = chan;
 	chan->dev = chandev;
@@ -741,6 +740,11 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	/* Enable RE/CHAN */
 	out_be32(&chan->jrregs->jr_command, FSL_RE_ENABLE);
 
+	/* Only record the channel once it is fully initialized, so the
+	 * cleanup paths never touch a partially-probed ring.
+	 */
+	re_priv->re_jrs[q] = chan;
+
 	return 0;
 
 err_free_1:
@@ -750,6 +754,17 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	return ret;
 }
 
+static void fsl_re_remove_chan(struct fsl_re_chan *chan)
+{
+	tasklet_kill(&chan->irqtask);
+
+	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
+		      chan->inb_phys_addr);
+
+	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
+		      chan->oub_phys_addr);
+}
+
 /* Probe function for RAID Engine */
 static int fsl_re_probe(struct platform_device *ofdev)
 {
@@ -759,7 +774,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
 	u32 off;
 	u8 ridx = 0;
 	struct dma_device *dma_dev;
-	int rc;
+	int rc, i;
 	struct device *dev = &ofdev->dev;
 
 	/* IOMAP the entire RAID Engine region */
@@ -832,33 +847,46 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		rc = of_property_read_u32(np, "reg", &off);
 		if (rc) {
 			dev_err(dev, "Reg property not found in JQ node\n");
-			return -ENODEV;
+			rc = -ENODEV;
+			goto err_unwind;
 		}
 		/* Find out the Job Rings present under each JQ */
 		for_each_child_of_node(np, child) {
-			rc = of_device_is_compatible(child,
-					     "fsl,raideng-v1.0-job-ring");
-			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+			if (!of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring"))
+				continue;
+
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				break;
 			}
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
+			if (rc)
+				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
+			re_priv->total_chans++;
+			ridx++;
 		}
 	}
 
-	dma_async_device_register(dma_dev);
+	rc = dma_async_device_register(dma_dev);
+	if (rc)
+		goto err_unwind;
 
 	return 0;
-}
-
-static void fsl_re_remove_chan(struct fsl_re_chan *chan)
-{
-	tasklet_kill(&chan->irqtask);
 
-	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
-		      chan->inb_phys_addr);
+err_unwind:
+	/*
+	 * Tear down any channels that were successfully probed before the
+	 * error. fsl_re_chan_probe() already frees its own resources on
+	 * failure, so only fully-initialized channels in re_jrs[] need
+	 * cleanup here; otherwise their IRQs and DMA ring memory leak.
+	 */
+	for (i = 0; i < re_priv->total_chans; i++)
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
-	dma_pool_free(chan->re_dev->hw_desc_pool, chan->oub_ring_virt_addr,
-		      chan->oub_phys_addr);
+	return rc;
 }
 
 static void fsl_re_remove(struct platform_device *ofdev)
@@ -872,7 +900,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

