Received: from mail-dl2-f36.google.com (mail-dl2-f36.google.com [74.125.229.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D24418A37
	for <dmaengine@vger.kernel.org>; Fri, 25 Sep 2026 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790315400; cv=none; b=bBv8fvpAuU3H4lOHXWVBf11tjAJnFMI7nvSHhq/WPCuddMdSJ7H2B2gKzayxx91IiJt10psst90pdKpX6jZYjzpIunY7QDh1oCg0V+yAqTkEYE2Vsutvp5QNjjirVWy9ZX1/d4SizDu+WPZnx0DYgyNaBVhXLrjoaVI/mOi50FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790315400; c=relaxed/simple;
	bh=EG06O5nGv2YQN0VST9oF+t1fwSadqDRUmkKfBj3ohro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fNkf9Iqa9C5pMGtVDDfMcZMuQOuhB0hbIfa/vuCGQjiExxD/6OuGKTA2wAkf+1s36Bblw4MAuJ6TC/cZNcEyhDfU9W8fqPi8F10GZXdGGC4TZBt5flb/TUejM8nZnh1VEOgwKDqeCZ9W9YKqtjEPh9rBrPnFt6aZm4w7FRZcsO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABRybzRY; arc=none smtp.client-ip=74.125.229.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABRybzRY"
Received: by mail-dl2-f36.google.com with SMTP id a92af1059eb24-14373bcc010so515613c88.1
        for <dmaengine@vger.kernel.org>; Thu, 24 Sep 2026 22:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790315398; x=1790920198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DwH7X2c0HE06d7+KW8RNk9wbjXMwH6aer++sxW6WHtI=;
        b=ABRybzRYYf75yvWfMdB5RPwUp9xxW6SNmHk1tSuDTCLYvJiMrJMA61nZgVtnlxY6d8
         UsDrImwhlJH5zgeMoSgJQVwqD+1yFuu+HBS31PUMLDJ0vHR9KtKcw7QHuYR2fNtXqtsB
         rsx59DKFZQqv8sr8/Bci6eEBxOsl6jYn5jCG4mYbGuSdC9E76tbNZv9ye4pytGpaAUDv
         LbcMoU2Otx/8jCl5M31HouSXpv5xqEVbUZukxl5yEPxgDu92P4y4FTkprOod7wquTy5+
         2f2UNVNvvUiwWxHl8ylF21FcmAVq0JDOdocpvi3YPI1ru2lAB9Y02O3ILz7c7NiETpr2
         htuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790315398; x=1790920198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DwH7X2c0HE06d7+KW8RNk9wbjXMwH6aer++sxW6WHtI=;
        b=d5XqJLrwDG81EAGDBKRPdW4MPMMBHRFYtOT2o3DfcqJAqBqmxgXl6+Igf6JRcR3kf0
         j4nCJhzZypNr5IO3ZRCzxRFAp+8g9Lz7Wb0quLDdJ6UnKhk0aK8rNqtgXFvzgpNCRgEE
         G2ecbMZELUvumiBy1FqxdfIrC9cy8DSqUJOyJ02SDBeEI8ebXVucBJxEltZPxZ9pZeaG
         YSQKluMdRtUMbKjWxIIjhNfjYO4nIpbQeoDJbz21AQiMS83DqMjPeGQ3/rn9sn9uNqIR
         b+b2F76cBrqdGUYmOCg34izYQQun6jTcwfsXPUPvkXJqDAp0oD3eINKAFL9chqUvW9iX
         oC2g==
X-Forwarded-Encrypted: i=1; AKwUvByRo6yPVym/g1nRxSA7kt6dSazmIsw+uqwYsOpoKRB2lFLEIjJDOF3NwKxI/R0hVSeYQNI824wL/P0=@vger.kernel.org
X-Gm-Message-State: AFuF++nbubJKNlGn/7R40R8YIGpO16iV6QVZZn5fl4r6aTlPFL129nFs
	k7VgBPSrrCgod2fFX9ou313MgEEnSY/ARqmfBRcBVwb05c06X0LDRr6VnokeO0LMrk+ntQ==
X-Gm-Gg: AYBFou3UCkzQvWAOAUhmszvcv3KwBYHgbIFpxsEurXhOkWU91C3X8yFr5GQYdYqTxiE
	5C15sD48aCgcLG3nhhnFXVfp1WBwnF81lJM3OFbGdbmIub3MpnADPTTP7a733w4T0POgev+w/nY
	xHs6LznNuXL/2izGy85Cjh6zey905j6PCBcEBPN4rAH+msxsb86RikzK8RrND/GAQ2cGqk2X3xO
	Y0k8FGndW64YX2GR9FdqE8/3Dz64DkpIjn72DCJufUblJXaSiTWeXiSHqRcipzB4DQ1B9RqL7JQ
	a7a40ytAp9nem5FHJ7aDt9KPAXYuJXsypkYXJYzjh27zncm4b+lNnF6M/PUv7mL7ulRmhATRYT6
	dc8BjNbMPL7AlE6KvvxQoaIt3P7w5Hvy2vNSRVG5s8OPFrqpLhb7yCtfP5Kas8GyJMZYMqhEbUL
	QnTkZGp+dRnMsrYywhz13899vvkYsC86HHO2jWk0XZcyEt0Qk+dr6LSW0GzWB690DpY2MC4ynm2
	QkklAXMbGzQPfhuZlAYdHTgeVu/slotptVEYT8sEOaT0/VfxA5PZDYlg/Jh56WbOj4puA8Rt6gf
	lv7tdeqDkL/J33HMt4GImK84TK+U2lffjLctkVo5B4LO7knuBBapz1hNlt0=
X-Received: by 2002:a05:7022:6ba0:b0:13c:d318:5b91 with SMTP id a92af1059eb24-145ee808dcfmr1307621c88.13.1790315397970;
        Thu, 24 Sep 2026 22:49:57 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c3f8sm3243930c88.3.2026.09.24.22.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:49:57 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org
Subject: [PATCH] MAINTAINERS: name the vkoul/dmaengine next branch
Date: Fri, 25 Sep 2026 13:49:53 +0800
Message-ID: <20260925054953.2965762-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The T: entry for DMA GENERIC OFFLOAD ENGINE SUBSYSTEM names
vkoul/dmaengine without a branch.  The repository's HEAD points to
branch master, which mainline already contains.  linux-next merges the
next branch of this repository (Next/Trees).  Name that branch in the
entry.

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
This is part of a cleanup of all T: entries whose repository HEAD is
not where development happens: one patch per repository, sent in small
batches.  The plan is at [1], and why it goes out in batches at [2].

[1] https://lore.kernel.org/all/20260924033200.3615554-1-matthias.goergens@gmail.com/
[2] https://lore.kernel.org/all/20260924101844.2403008-1-matthias.goergens@gmail.com/

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 140eafcbbd78..b37df1bf5c03 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7701,7 +7701,7 @@ R:	Frank Li <Frank.Li@kernel.org>
 L:	dmaengine@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-dmaengine/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
 F:	Documentation/devicetree/bindings/dma/
 F:	Documentation/driver-api/dmaengine/
 F:	drivers/dma/

base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.55.0

