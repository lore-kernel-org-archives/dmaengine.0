Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5ED3B5E01
	for <dmaengine@vger.kernel.org>; Tue,  9 Jun 2026 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043608; cv=none; b=t5d2NgrJ9b5tIWfZ0oh91Y6ecN9wtT/dZivhxt1sH2obm7dpJMcVguoxfwiblyrnIcNbY774/5IF0wWRq/bUzkGK28yx/opePkTtLP+Ku2RxHPJ9g+UvExJfTI0ebZPcEG1IdpuIAYQRtxpRheOEjHBPQRZWxigUfgSqaXzhyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043608; c=relaxed/simple;
	bh=kgVocsnpOJdD5yoR8dUG7phDR5AJisyXcC1TO7JH0ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RzBTd1RyPysNC8JoQQ1MZs22WKzwj8z/Oavlqb0y8nAZt/bhL/NcVmCgMsEUlMnZypyVPJe82dC0/Min3y5Sk+4VkA8aJRaau6ypuzMfBV1LYw00eaAS0NxAh43u9knWGb9N4i9ZIXdXfWvh9Q8VMkQIH2KbtYilwLIPPA5gMMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzxukmS0; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzxukmS0"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8588ec1b44so4162544a12.1
        for <dmaengine@vger.kernel.org>; Tue, 09 Jun 2026 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043605; x=1781648405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ULHTpyGJ6cpn7WfROoaIerINb7NFwICa9HOQzecsP0=;
        b=hzxukmS0xMoAAl1G4Tg3mxv/g684jGeDvme9pKMmNcMO38JfNTi9JTuvF4L8zzNyv6
         Ntm3CsGsFOQdaHgHmEYWl5BDY28rYhx+KMBqWzCpalAOyqOO9NcuczB2oLgAQPXFzvQG
         Bwmr3gdbuyM6sCPTz45+4ClSVXancXDOZ61qRd87Isnj2RIBzAxKij4enGgpWRwo9gxe
         lrUlXW7OAd3KUav0iQLwAx0itdIzR9VPGghvr7eQLeSyKqZTxZiZdwZHHizL8t0RjsDf
         qDayW+y3Ee2APGi4MzSCwZu76LwHm+uGh3aRcIilkb7+mpPQ0AFFr8LoMkxm3adMNUaQ
         ifww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043605; x=1781648405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6ULHTpyGJ6cpn7WfROoaIerINb7NFwICa9HOQzecsP0=;
        b=Rs9Tk4yx33GtuLeP3cfnQnI7IxSlHplx0etpW+jm6/yoEr2OjRWRPzinfcSgsSYJJP
         f511oQ/sRWcqEEu5wjwjn4MLKklDqZBkbS4trCOYUiMRf57ID7GbikeE3/sLZtUP/Qa9
         qiIjY/ESfB3qL3DyTKIDYFFyMcXV7r8QMk72WVgLmyX9u4OFO5hZag/N5NAkDDga1PfZ
         XR4J0EhE2Ci4V9tO389eLnUEDBqRcE+pUkF8UXlKaOj5J3nt1G08nDnx+MibnLjk/b47
         XjxAhmJE1qzbIDPXqmFejnTGKitDYFQKoUbsIGJ70/aeMhAO9rUTEgycYeEsXOL2egh5
         CS1Q==
X-Gm-Message-State: AOJu0YyhMa0iAbxtuhp8PDqNG4LF2cEtXEFg+5yF4T0CAthMzPbFc3T6
	7BQSWt8Ezk0zBFsUggN82XNUh6qU11GBXQJkwgP468zsCOse1whtJei3K52Caia0
X-Gm-Gg: Acq92OG3hCZ77Se6Ra++kybe+B66JQAgZ6IRJ5K1K5jCIrUpAWzA1Ef/AtzR1bfhPFb
	XLkXCwiporpyS99M4MoFyhMZP6dFw32lNaaYNc4oBoWEyuvU3Dju05OswrX5eFz7AfWl3yGCwli
	liYoxzyugd5iRwO8d6F0U9Km+Qu35+xFRLu8sa8cYHS7QPYrg9uS0czwoekwKwCcPmQivNloz51
	7oeTkhWA37O0tBIwCHbV8vlw0QIlynHy8RRfHUD8kFO0QRgyvmhWVYxWUhHXYzrg2kEHNmjdLfG
	B59iI341pgBhcXBf780l8S7JaRi0Ic0c4y0Y8WPkQM9S6BVMJi4DwIPMN6H6Vz2zyvso302Pt4f
	PiLB2nRwOqnCAyd8HCIhTt49IQXKwO40k+mQC9MaGKhq+3i44vBvXvWmDCDzbycApOe7jbOVrdD
	EIAwqTjRhYrsffKbMPcZQIx+Q6q2niWOp2s2l4/tbi4pSzxb6Kj2LAutnRVaWQBObxZ5NIcgYVb
	2k05uMvJ9xo8rnPm1tvLq6+dZrqhzEzEZatmQNyxZ4nJQ==
X-Received: by 2002:a05:6a21:730e:b0:3b4:cd6:891 with SMTP id adf61e73a8af0-3b4cce1eb3dmr26797561637.20.1781043604699;
        Tue, 09 Jun 2026 15:20:04 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df04ff24sm19661834a12.14.2026.06.09.15.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:20:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Zhang Wei <zw@zh-kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE DMA DRIVER),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv3 10/15] dmaengine: fsldma: use devm_platform_ioremap_resource()
Date: Tue,  9 Jun 2026 15:19:21 -0700
Message-ID: <20260609221926.35538-11-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609221926.35538-1-rosenp@gmail.com>
References: <20260609221926.35538-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert of_iomap() to devm_platform_ioremap_resource() to let the devm
framework handle unmapping. This allows removing the out_iounmap
label and the explicit iounmap() in both the probe error path and
the remove function.

The DGSR (fdev->regs) and per-channel registers (chan->regs) map
physically distinct regions in all supported variants
(EloPlus/Elo/Elo3), so there is no overlap risk.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/fsldma.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/fsldma.c b/drivers/dma/fsldma.c
index dac12de06ef5..e4a3315a7d9d 100644
--- a/drivers/dma/fsldma.c
+++ b/drivers/dma/fsldma.c
@@ -1238,19 +1238,15 @@ static int fsldma_of_probe(struct platform_device *op)
 	fdev->addr_bits = (long)device_get_match_data(fdev->dev);
 
 	/* ioremap the registers for use */
-	fdev->regs = of_iomap(op->dev.of_node, 0);
-	if (!fdev->regs) {
-		dev_err(&op->dev, "unable to ioremap registers\n");
-		return -ENOMEM;
-	}
+	fdev->regs = devm_platform_ioremap_resource(op, 0);
+	if (IS_ERR(fdev->regs))
+		return PTR_ERR(fdev->regs);
 
 	/* map the channel IRQ if it exists, but don't hookup the handler yet */
 	fdev->irq = platform_get_irq_optional(op, 0);
 	if (fdev->irq < 0) {
-		if (fdev->irq != -ENXIO) {
-			err = fdev->irq;
-			goto out_iounmap;
-		}
+		if (fdev->irq != -ENXIO)
+			return fdev->irq;
 		fdev->irq = 0;
 	}
 
@@ -1321,8 +1317,6 @@ static int fsldma_of_probe(struct platform_device *op)
 		if (fdev->chan[i])
 			fsl_dma_chan_remove(fdev->chan[i]);
 	}
-out_iounmap:
-	iounmap(fdev->regs);
 	return err;
 }
 
@@ -1354,8 +1348,6 @@ static void fsldma_of_remove(struct platform_device *op)
 		if (chans[i])
 			fsl_dma_chan_remove(chans[i]);
 	}
-
-	iounmap(fdev->regs);
 }
 
 #ifdef CONFIG_PM
-- 
2.54.0

