Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4F743634C
	for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 18:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385566; cv=none; b=uGHWqsRWk+qbOhSnhd+EnM49z67hkbdYuChOvAVubNFNQ3JK4G67GECs5ZK4c/OWNh702HePZ5xo7l9BUWJQnINF8wiU+jJ//aU/X8Lx/FE2FL9uuhe95bnKhtRAI7D2stTREwx6vZfkWGl7gIX0fVK2Wt3BwwhZETmDLtYHcfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385566; c=relaxed/simple;
	bh=LO4ilBoddGqA4AcFyKfdvCDOpEzI2RIf9g1sWHQgAT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXso15debqCdEdXU9i9o8/OKLG2qhK7j9lERwUsZpwJhGP8DUfEn/X5IL5XEoKRVTz2mpCbJxES8mV+k5jE1ToW7wYkDirY+Z2J0Y6BreBTVBIWFAf+xEibO5eJ1L/SzQyLoD27irSlD18+bJD7S35K/Rq4HK6ukevpscqJI5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ghbizmnf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ghbizmnf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d01663d816so19234655ad.1
        for <dmaengine@vger.kernel.org>; Mon, 10 Aug 2026 11:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385565; x=1786990365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0fKTNpooBtTNW6bieTS4Sn1ltwivMMtcmL45dsUlns=;
        b=Ghbizmnfhz0+NP2tRXQzT8uJW8eSwzD/lMZv1x1SjJAJ23+Ege62bbojjUUjfEy+/E
         pOfGjQsiZCR4TDng1RjeqzfoQqk6JuWHDrVTZhpsk7lqz7PqcKFY+jkcezWBzYIH4Hta
         CfJECzM5iMcNVaBBgutzRpwznmmjZTWaDSRXe4mXDzHjCqD0KKWnNzazCokhgs5Ceaxq
         1SqYmuZhbL5fFEUrwLfq2DMORK1fQqhr8higWiViHBTH27IclAB/9YSoe1wRrXNtFkIg
         hTJLlBTY9Ysaj9x9FglzPi6SI4Tsc5RPEULHRCwr85ibcWWH6Lp/Qww0tRLePdLTdn+c
         xoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385565; x=1786990365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E0fKTNpooBtTNW6bieTS4Sn1ltwivMMtcmL45dsUlns=;
        b=lpfltdSr33dKcWOSlM5lz5dOVSoLPVrO0KA9zjMKrFCM2N3MFUkU9cGiQaLHSQCev/
         ciCfpYtnMD21APfnzF95VAQScwFqulQjP+oWfPmmyIJ97lUqb4yTWKTAr45EMMJVt7D8
         KAJnCtjAU6HhI9bBZ9hCJ/28qJ0cTBeEfCBoewdz1ykjntJd4wAabbEOTSQXxPS7Qpln
         l2YPusJSFbsNHS9qgLqNQYrPuB+9j0M1hncLtO4rP7LlG/93dz3lP2vzhae0sVzlLuBS
         YrF/0r5CrWxJLvLChPyufs0/NJjy8s07j0VNVbBW1edOmKTNRK0j5KU2HEbkxEtUerE4
         lCGg==
X-Forwarded-Encrypted: i=1; AHgh+Rp98k82dr03f3lUKiLNCvzyBFDVsSpt3v6tT44Wf2Ms/qBoBAFogLOQ2f37ocwltGorz37aFiHtBoo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFWsgQr8+eXRqf8w34oE0kC7Qx9BkmYPog8Eovz2vFahxkhk68
	Yps6kavSF44lFUMWVQg0lKveopGZaHCK4n+LpBknoygrAVFGEnwB1DBT
X-Gm-Gg: AR+sD12FyIvadLeqop39XdRKuiFmAL8xupxIHh/hEftXPftAZzfZeLwjQ3ssy1baRfe
	JPxZbY6ettbrq012X7Gv6pXCLR5p/eT4zMTDWACILSJ019MHRm2MS1BnKKMOtWniusWNiBqYcMj
	WaI0pzTDYdU+uRJ8PE5tIWilvgTmrxFzse+zCqpXBlTD/tcYHRvAnOrAOV/D+8BSfDx7Ui4g4cH
	VhHjTCzTQqBFsM3i4h1qu3TE+kSMU+cjskVB1k7R4GfvUtzdzczLVFrVnbyELFCz9/TzkTnLM/r
	uu5a1k5SVJKlKRehQBf5RhPcOlkktia5PO9dgA3rDvN0F0+jRiLFCVwmG2bpTAeDKo5IiKdA1XH
	Jgg8d09u2TIfXpPofK4CzQle//P3m010pjcMcF9x6qvumLnjxzq3ZsFs49Y4hjila4FK5M+621X
	KVMfSAFn7Zh3nSJuXbuTBS2NUugoXguTNO7RMyTj+uqfbiWylyvOF0nSxKzbijpTKz1Y2PYj1L0
	g==
X-Received: by 2002:a17:90a:d444:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-3909d79f918mr32734942a91.2.1786385564472;
        Mon, 10 Aug 2026 11:12:44 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:12:43 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 20/34] dmaengine: xilinx-dpdma: kill vchan BH on remove
Date: Mon, 10 Aug 2026 11:09:21 -0700
Message-ID: <7185ee59e7bc0451f9ebb19178d3f76edee65658.1786384169.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH
work. Cancel that work when removing a channel, while retaining the
driver's separate error-handling tasklet.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/xilinx/xilinx_dpdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
index d9a3542c4531..7e147ea11368 100644
--- a/drivers/dma/xilinx/xilinx_dpdma.c
+++ b/drivers/dma/xilinx/xilinx_dpdma.c
@@ -1685,6 +1685,7 @@ static void xilinx_dpdma_chan_remove(struct xilinx_dpdma_chan *chan)
 		return;
 
 	tasklet_kill(&chan->err_task);
+	dmaengine_kill_bh(&chan->vchan.chan);
 	list_del(&chan->vchan.chan.device_node);
 }
 
-- 
2.43.0

