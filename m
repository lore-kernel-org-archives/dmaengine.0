Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794211797;
	b=iz7WKGh9hMKteLLYURo6lxbJR3v7ix+cM6rarzZ+dudr8pp5MCt13W7FVw2oUf4cdN+j
	 IPjutIIYSeBcCKP2L4rI8QIPys+FS6VFqQKwlFO/n/3/z9wJYAeudyRZxU60KynJ+6kk7
	 SoINE7IQ/0IuWEf/iXxSFRVJw29ag2Yo8j/zJPjawALYJIm5qga/NUJO1TuU+fejlehdJ
	 G+QYKeFtRW5CE2gFzNyiSEifqVNJA7vTue8bb30Cz7FIYULClrVE4etdt3e7YEDSW9Qpe
	 bSpjV8K/Hq+7WjJ+LFMiCyAAcmqV5zSJSeOKt/60VebQlsmna8a42/zCIFRefbDMaUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794211797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ztQlNM7XWz4CEoSo6w0e4xwJ1jm6ckTfoK4mBSuQIVc=;
	b=zbV0TG/hG2r3JtN4ig/mpazYLtaUhInFFG/ViNbAQ4abrPq7oPjLYhrN6MTdkUiOpSGr
	 2Nf/Cw0wCkuw6I6inS0+ft5fJvC0el4ZKGE/+3kDqBWRrC2lSLWYZY0t5p6+EgRSc8uPZ
	 y6m5fmf19tB4BDnNRHPkfgwhTIIgzMJHpr50mug7+JJq1ZhVOMcvMq8JDEis7ckyzH/Xo
	 QYcn4rvLiH8MirW+E3xF8fHwj31Rj9qG++ZazDJYOP22VrI6EMBynpnnKgcKiXFYcOWqw
	 bJj/pY/J2j4U5eJm7TZjqTBA1E9EX6QjCmv6YbY7Wv7X9VuIbD+8FRje4RbEoXU4WXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8GXBhUy;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23A606A31C
	for <dmaengine@vger.kernel.org>; Mon,  9 Nov 2026 08:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E23A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w8GXBhUy
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a315ed211so679308eec.0
        for <dmaengine@vger.kernel.org>; Mon, 09 Nov 2026 00:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794211797; x=1794816597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztQlNM7XWz4CEoSo6w0e4xwJ1jm6ckTfoK4mBSuQIVc=;
        b=w8GXBhUyTBNA5I6vw+zUjd2EKLqqGh6hy8FxyCgrtCmny5K67D5B6rQE6QFOPd6V4N
         jkFVI2pEKed1G9uE9R5cMCoF7aFqlC5drolEAv/pnK0Sn+YrtT/TmahNNCH7xS71amhe
         ny3d6XQKb0IwhNyheyRIQWiQjjpEc7RyYyTuqp3rK9uv10VIY3HmZjwlCSp9wiQHv1IP
         z97vSRmENuHlBPqfr9QJIMzHAudOH3FpS+2Jj+lYjio3hBZiTRVSqc77fNA6drEW3M5i
         erXP9eQFraE0BVum28c9fHS+chuHjXdAHm0feRXcB+UfgYZ2841XgEv0MlFZVO36LQsS
         Zjdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794211797; x=1794816597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztQlNM7XWz4CEoSo6w0e4xwJ1jm6ckTfoK4mBSuQIVc=;
        b=gLkqOUZiMaOm+vkd+CI9f94fAjFqu0jkdKM0Aypu++iLMgxt3MC5ncHJfVm+KdXc/X
         vQZQO7yeJVsO+zQFxAgIveknk3Djt+AkuJmlL2Mnzyg/MILk37YzdZn7VNgECrrhiHyi
         9r8+NqJ4R66DtGLZxKo89k+P/ETvlgl1Iiyq1DHl63brNlvYsLQcl43rYnxQcKQPs1lg
         mNEWhmvvjVDT1Qx3K3FM2dDeeMlNStGpn2v8lpOLYD21MCDh6EKBaAvOf90IPI57fTvF
         d73J1j9qgMXqIsbWlAZzyUkpUeSuIptYdW2pLdrkY9PymkUQc91ytQpEc6qI6AJ8jhwB
         CAwQ==
X-Forwarded-Encrypted: i=1; AL+hErHlnNQdPZj9kpjWDqn7Ijg+BnU68S/KAYysfZ8G3PPgI6GfTlB4axGSmx7pQa2JrXYgexd/S6ZkBYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VA21loQrj5St3+cKWNuRzw9ptw6vE26etLaLLnodOL1Eqnbre
	aD6YaX52VwFjTvKnQZNy9mhCbwQ/uRPhLkA6KUAIsTovyxQaQhvsmJnpuQ/CAuwj
X-Gm-Gg: AYBFou0FUOT5xgqcIiJDiEJ5ML2Zt96Oha82w5/t1/TI/b2ORykVhdS1CenUo/ZXCKr
	lR4qDD1V8l5VmpQUZ/QT1xv44JqKg5cz+RBbYCGOiPWND10Qxul/bCla14MDNmzIIqrqwls0JJd
	cP269aNUZLal8MFcXcxPI7MLrxP6A8SHcwkiL0JEds3ksuCt2qjGxZs3FLxTQ8yp9vsBhVWEyMV
	w8oF7MHm1lRyvEGa6bVA33Uc8/Ye/24VQQV3zzd9iVpuF46HqK6belgNK2bsttsdeAaz8PrCB7j
	ULBjcLULUfwEdpTMC8WsXFz05tvOXiNAzrdvjbsWXOnZjM5grcdBmbevH22KomXeCiD3ZR1i+At
	iSTS9s6DnterDI1uDztF0LAfSgSBqBIY31yqqOKl0QnwnJNqpPbIb166G9uTGcUpQOQcEpuvK2N
	A0XQNCO+bmxSaO0Q+Q5foMkUacAAta2WX8GZkKZqoRo1U4zf+NNwgMQaNFCkscUW16ysW0dJlC5
	y/hpkl1dChG/eoUKLcffSgKeTuBA0yFSmjExldxMODgQ6YfJ7auF/K5kSr8szWxYAU8bedYkphL
	qjQEbbJxbJKhpWV7qELyNUrGS1MfBE3HUcrUuw6+rhwwypZY
X-Received: by 2002:a05:7300:ce09:b0:372:7af9:bb0d with SMTP id 5a478bee46e88-3727af9cbd5mr5545311eec.19.1794211796529;
        Mon, 09 Nov 2026 00:09:56 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726039c635sm10835245eec.0.2026.11.09.00.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:09:55 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Zhangfei Gao <zhangfei.gao@marvell.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] dmaengine: mmp_pdma: kill tasklet on channel teardown
Date: Mon,  9 Nov 2026 17:09:44 +0900
Message-ID: <20261109080944.1368218-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hyunjung Ko <hj351016@gmail.com>

The per-channel completion tasklet (dma_do_tasklet) is scheduled from the
channel interrupt handler but is never torn down.  mmp_pdma_remove() frees
the interrupts and unregisters the DMA device, but the channel objects --
and with them the tasklet_struct -- are devm-allocated and are therefore
freed only after .remove() returns.  A tasklet scheduled just before the
interrupt was freed can still be pending at that point, so it runs against
freed memory (use-after-free).

Kill each channel's tasklet after the interrupts have been freed (so none
can be re-scheduled) and before the DMA device is unregistered, mirroring
the teardown fixes applied to other dmaengine drivers.

Fixes: c8acd6aa6bed ("dmaengine: mmp-pdma support")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/dma/mmp_pdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/mmp_pdma.c b/drivers/dma/mmp_pdma.c
index 8abd24e..2f0de65 100644
--- a/drivers/dma/mmp_pdma.c
+++ b/drivers/dma/mmp_pdma.c
@@ -1119,6 +1119,7 @@ static void mmp_pdma_remove(struct platform_device *op)
 {
 	struct mmp_pdma_device *pdev = platform_get_drvdata(op);
 	struct mmp_pdma_phy *phy;
+	struct dma_chan *chan;
 	int i, irq = 0, irq_num = 0;
 
 	if (op->dev.of_node)
@@ -1140,6 +1141,14 @@ static void mmp_pdma_remove(struct platform_device *op)
 		}
 	}
 
+	/*
+	 * The interrupts are gone now, so no new work can be scheduled.
+	 * Kill any tasklet that is still pending before the channels are
+	 * freed, otherwise it would run against freed memory.
+	 */
+	list_for_each_entry(chan, &pdev->device.channels, device_node)
+		tasklet_kill(&to_mmp_pdma_chan(chan)->tasklet);
+
 	dma_async_device_unregister(&pdev->device);
 }
 
-- 
2.43.0

