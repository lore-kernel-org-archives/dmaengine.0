Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A97D4582EE
	for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 22:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672294; cv=none; b=K8NfHOpyYk5ZBKQsYaQt630WDBBcRhN3sc+YtlZgFKETXONfI7tlZD8Zb/GemBxlOdLDHHUyQI+3wr6ekdItu/UOn3VOkATEWQB7kC8VPT2TCI0fdJylW4XYbj23u40k6P0EgL9iLRGr6bpGfpLUXyv0FomeSlxveAWEqkb38kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672294; c=relaxed/simple;
	bh=kFOfS5xdApdMgbbVcCaKM7jhSzUJTHEQINnMLH0n/7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bop2ym79c7ztlCRJPGebCmiuwSUf0nom9rfQgIR4bCdQFKTyfDW6iYkr6GtE0sYs5yzAIcX967+eZhkztAuG2ln1ggaTzm0DMtG9H/0OGHgM4gsynm8P3Rm82zPeUzMWsoj1oBgq0sksuhm0976spDcdz+iOS8PZ08Fcx1z8hpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHzFzzlv; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHzFzzlv"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so7576446a91.2
        for <dmaengine@vger.kernel.org>; Tue, 21 Jul 2026 15:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784672290; x=1785277090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hT96rdJy8FBS8F65UT4Q4oCu4L+PHAY51bzsdlTVDFk=;
        b=RHzFzzlv9V8mkhIpSNxjHLIYGNW9s9BHvQkAWB9c0mTXz+oLIS0hpgkKvwQqoXsHmG
         LioMly6Jw8iWjvtnquKV4ks4TkEMCtOtwzQDw59oN2J4oNYFO+agrtWvxcRdZLx7ee0w
         JYAgcFwkFOJ0lrbMUP+kZpMhltQVgTo3S7mYasP+tVrpNY5ofjulXWHg5Ix6X0C8kHBd
         gNNZctIgrc7rWIULfSCIU3KkXibbdyVvsUg1tclYW5KFgAJ3nPOimHvBQ3qvq3ugHgK5
         Gs6TWok6w6B+kkpKLACCR1NVW2pUPuOxrM/7MjLtN9Nkn4JzY6m3j2VO6n0ZSSk+LRQr
         gSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672290; x=1785277090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hT96rdJy8FBS8F65UT4Q4oCu4L+PHAY51bzsdlTVDFk=;
        b=AlwlL0C+v5N7uW6I7sV+IoK6am3ayM5bURaBz5Ip4dmNI0NZlHBK4K8LdWMX69RiES
         K0q4QA85Yh/Ft9fQQ3hrXPJMD4H1+g6mTBiDxjEus6HAdHnZ8dEE/0eopuM5d3t+A9Ty
         TTpNOzH3o1dB2/fq1jsKuyv1CeT1oMdEvTELggpOKL4mqrncT0CrGPQXwDCsqSvw5TGT
         sweUdgJ0oQ6h9ZvpuxvYnVGhJI2KqGr9rrCfukiZDS0i+YojVIgXuwquVSucAnxjMvNX
         /h+4g2yBazIEWRDwPrmFX9GIjsZfVyPzMmmvcB/11OR3WzCMgMEgdeFtVjtj78bpjF0x
         4/Uw==
X-Gm-Message-State: AOJu0Yz6jJLCMzy7TS4zg2j3feBSwmRoKxUt2Td9LkiCevO1XK8qvQ4Q
	56YXXGChm5FUD0os3yPFL+dfK8pq8IyDUygPJsoPgZb/tIYxRizF53z+nfp2cg==
X-Gm-Gg: AR+sD133fEvACLE/Chi6fgfg9n22JWM8RrpG5fWU9yg+RSy6Ou+YgRQcFp7NwqhIDrn
	tDELFIT4jHqVjSmTwsnpictcQH+cEUKeamzwYPMWcLh9e+oBWzPVk3D/8HjEPKgtbveMpRn8Hsg
	rt6TBRMWnsJu/3ZLuU4CmIRcLXY1kpqXlf681KIs+b2XiAW41wU5h7etv2tPYnKrPc+SdFmjUTd
	J6o3BBiup8bB2PPFmdrTw4gJvcVTdMKLOhbynY4ukY8XqedUeXKNLdV/TKUDRakMzEWX3sbmuOz
	eTYr2uEEnjoOczSYzdboNQHw0+E/vNzhEnZVwENHttvDJwd5rLFM2OE/tZE3zxN59DkXsZXBuZq
	vWuUsucrZj2p+Vx6Q/AZ4bg+YeF9aRIvLPTjzCE5RY03iLZnB9r/idZySHRBq/MGVtzwZsN2A2Z
	jFm2qgAYXPiGHK61j6sZFYhUBjh6KFQo3RhEcw+vWxFSvC8YSeYmLnCnr3jEL6rsTMawuA5N6zF
	HqrjoQETUUNnziBVcc93xj0ESabaIOJOugPzY5Qhqa4BtwunK1ovHE=
X-Received: by 2002:a05:6a21:7008:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c3ad7a439fmr22917984637.22.1784672290136;
        Tue, 21 Jul 2026 15:18:10 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm2236387eec.0.2026.07.21.15.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:18:09 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Tue, 21 Jul 2026 15:18:07 -0700
Message-ID: <20260721221807.664865-1-rosenp@gmail.com>
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
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index bfaef6245695..66de27eb4365 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -841,13 +841,30 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		for_each_child_of_node(np, child) {
 			rc = of_device_is_compatible(child,
 					     "fsl,raideng-v1.0-job-ring");
+			if (!rc)
+				continue;
+
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_warn(dev,
+					"too many job rings, max %d\n",
+					FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				goto done;
+			}
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+				dev_err(dev,
+					"job ring %d probe failed: %d\n",
+					ridx, rc);
+				continue;
 			}
+			ridx++;
+			re_priv->total_chans++;
 		}
 	}
 
+done:
 	dma_async_device_register(dma_dev);
 
 	return 0;
@@ -875,7 +892,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

