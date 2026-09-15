Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468534CE669
	for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 19:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498877; cv=none; b=hlitF3DFskMH23VuS3MLqzi43zsokHri/FGBptKNmQnxr3p7BVV4WEwLHKDaLj5la39aRSZhFoC+XRgLeANW+4m2BzuMH7ofvSyBt0v/D9+5oR45vRLfGhhVVrzmJW8iuvWVWPZfw2tP7mwBikta5fpyfF/x1i/OHsPKvEmFqnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498877; c=relaxed/simple;
	bh=l4t1jNOLy02YBOh7dmJnJlpg7s8WJAsAgZVpnp46ojU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XvJYn1eVv4LHwIf1EOc8Y/gnfA5tlVqDjiJi9bKLxY3UpZQWNEQgdbAezQvk2CZhnXEUZ6nWRGscTJewlI0DXMt62kKi0F6Rzuo39eYp4YLmaoSH4+yeJaQ7hKBPgBA5Kyhsh0tjo00oYjUq1pxRf3GFWBdCNl+xdgNvKuu5t78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m35+zrJ6; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m35+zrJ6"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so27267a12.0
        for <dmaengine@vger.kernel.org>; Tue, 15 Sep 2026 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789498849; x=1790103649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9ubRUCKOUA2J3XCgMm19BhpyuYjCphiG49HTeWE9Tk=;
        b=m35+zrJ6UMUTGSAaBA5BIUl2WiDBffuk8IhgAmy5jml98aYwSppkDdPdm6pKzGYXkU
         bxVwMffzx/pYksXKOvYPYVkJcJM5gNUVkBzKnSefXbJFdrregMxWhuai0hmAoNX+OMfd
         KigOLE8yFeVro07CbCay3rkaN3Z3SPgjKfX18IVgPo3Dki0Bvv668PrkZ7m3WQ4bnynM
         9rJ5X71YlwuKIIid/ejCaE77FNB0w3PMu5rZbufxdBbJONzQ+cXDDD9VHvtuHTTtRXMU
         ExKVxbxZNBSNdUcDlh0g7TebsVnSQmHwkIg0qxPM4yuSg5dLxqZx3tDvxJ9rkyWCfjwo
         bRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498849; x=1790103649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9ubRUCKOUA2J3XCgMm19BhpyuYjCphiG49HTeWE9Tk=;
        b=uOtifZTE4895B81bNFS2j5gRPYWe2NNGEtpCaew5CoROv0TdKWRzhXBksmQcgE8811
         Y4xeWmCttr2At+utknjfFZwNuDW3A571qxjMwbWDq7TJv8LzREsV/ob+ISiNZneldnKL
         B3kdTVa2iGvCp/NzCGR+tfPbhCgNdNyLfijtwqRtIrHbCXFDbff4acxJIEEiwdXBBq9p
         Gk17AxTG/sgi3Rq05o6QndVJLmHnp0Lwbp2j0k/xlhbwK8BAkN0vbxV7MGgY9Ks8RMSw
         LOHmeSNccac8BVnSBQD421EzVpidBSKS96AGMFAwGl9evqQyMykSeMRxAU/3hFQhhFBr
         8oFQ==
X-Gm-Message-State: AFuF++lTDJyTywk4dWeqcmuc/5N+6KUfg690xpXQ0jVZVtcB7Cjmyq7d
	pA0aloDOymR7NePUZtz8pclCDBoViej4Yc3Zsdt85gff5G+qup5vVsZ1BEd8cg==
X-Gm-Gg: AYBFou22fGnfUqU4fNj6wLVGl2xJFlFi+epwH/dOOa/ne5e4m/d+owdGpWnxfy5yD7Z
	VHmbZxO/DZ7jB9+W3rlVansx9BJ63saYEchHSG9SVwzGCTGYdretoHlTJgLpSbUrp7DZowwJlc0
	f6dHACHbuMTO4gdt3HW4diOxH9RoTbxwO/LyzlaVySaOCSJ5HBcWTF9JSKfyMqCKknRZrkEljO1
	HxCh3K5dcbZ/Dyf7BMldSCSI3qfodXV3sgT3v1ZXV4xw/+tA2xrhtv54H3Tgj/6NmHumZvlwRAn
	U7IiSf2jiX5JlkMI9CJz/0UjwwJ8jfs3fb2I4Sq0a6o7s0k7QpybGg3JBFJveKXO3+9P6LUiXSA
	pO6sIlXGpO36dkvXY1UlKyCiCtsHxYiNnAOMivUExmEdYrRQLLhon+wiKQC/HEwvFC87+PUTVcD
	t4U5JDVaHAOF03tW4qEr4du2ixFEfypKoojHwYilwqseBkONeJ5gr+lnxfBF8BYuROQ9+f+f9Pn
	CmYJtmp3tS8HfiYLBiR/koT5+52fohhKMcX85AlTivpZD+Vm04u+5UkVGRr2pRp8w4o9BeaZqjw
	RmbW+cyn6xZ1mlSbF8/J4qkZBxpd/sEOwiUvVnZkhBAam/uGz6uafYHKMv8=
X-Received: by 2002:a17:90b:3842:b0:39e:b0d:d274 with SMTP id 98e67ed59e1d1-39e0b0dd4c1mr2936420a91.10.1789498849414;
        Tue, 15 Sep 2026 12:00:49 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7a3cc9sm201919a91.14.2026.09.15.12.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 12:00:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Xuelin Shi <xuelin.shi@freescale.com>,
	Harninder Rai <harninder.rai@freescale.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv5] dmaengine: fsl_raid: check fsl_re_chan_probe() return value
Date: Tue, 15 Sep 2026 12:00:47 -0700
Message-ID: <20260915190047.86218-1-rosenp@gmail.com>
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
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v5: put some stuff on one line for easier readability.
 v4: use break;
 v3: fix sashiko review
 v2: fix description
 drivers/dma/fsl_raid.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index 9cc289f7129e..b4355eb0098d 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -836,18 +836,27 @@ static int fsl_re_probe(struct platform_device *ofdev)
 		}
 		/* Find out the Job Rings present under each JQ */
 		for_each_child_of_node(np, child) {
-			rc = of_device_is_compatible(child,
-					     "fsl,raideng-v1.0-job-ring");
+			if (ridx >= FSL_RE_MAX_CHANS) {
+				dev_warn(dev, "too many job rings, max %d\n", FSL_RE_MAX_CHANS);
+				of_node_put(child);
+				break;
+			}
+
+			rc = of_device_is_compatible(child, "fsl,raideng-v1.0-job-ring");
+			if (!rc)
+				continue;
+
+			rc = fsl_re_chan_probe(ofdev, child, ridx, off);
 			if (rc) {
-				fsl_re_chan_probe(ofdev, child, ridx++, off);
-				re_priv->total_chans++;
+				dev_err(dev, "job ring %d probe failed: %d\n", ridx, rc);
+				continue;
 			}
+			ridx++;
+			re_priv->total_chans++;
 		}
 	}
 
-	dma_async_device_register(dma_dev);
-
-	return 0;
+	return dma_async_device_register(dma_dev);
 }
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
@@ -872,7 +881,8 @@ static void fsl_re_remove(struct platform_device *ofdev)
 
 	/* Cleanup chan related memory areas */
 	for (i = 0; i < re_priv->total_chans; i++)
-		fsl_re_remove_chan(re_priv->re_jrs[i]);
+		if (re_priv->re_jrs[i])
+			fsl_re_remove_chan(re_priv->re_jrs[i]);
 
 	/* Unregister the driver */
 	dma_async_device_unregister(&re_priv->dma_dev);
-- 
2.55.0

