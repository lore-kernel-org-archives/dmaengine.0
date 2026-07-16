Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DECB34F27F
	for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 20:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784233795; cv=none; b=PRtLgTEdn8ZVIgBuUVBXBWhHAArTgyklZe5QKlXFAJ3HbC5tz1h4VHfa4vPmNg8HN6BdZdZEZDCdSHw49jpqMaUxYtluHGB6zY8BkZP+AdAVoQk1b1KA9lOJRGC4SaegShVZkCWSpVQvUg68KplH5yd0Nh2FPTc49UMz2lDxkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784233795; c=relaxed/simple;
	bh=dkVGwu4vEDLeWwTYlZZmsYVQJ5jzFTbSfPYoCEcHEUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WUTJMboWmJyJa7wZwmqo4ZBnbf1ogfXTXAK6MF3MFDCKy++3AaXFIQbI3LLcn/PD3W2S+RAqvRYTKQhq918lP21ljwslA+s/icHP9/rEnuP/FLUW2CSJZ9CpAjzrTY4+ks9i30wtzAPK/SqGX4o5BabBLGIEJ2WTXDAGSDQBkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQLi0YpC; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQLi0YpC"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485ef63b68so6581655b3a.1
        for <dmaengine@vger.kernel.org>; Thu, 16 Jul 2026 13:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784233793; x=1784838593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8n/qihM1wH8ZL18Ajd3REpJyisiDchT34om9j3flBi4=;
        b=oQLi0YpCHQdnOsoL3T/bPpBYwLjd9IDPQk2UoPE2MuSlnNxA2XQ/bkRuCNCvnvH99i
         gmH4LgUirdlflBOsKJGvTczrYsqz0v+v96Lp/5PyNNT6w6kkXChUE1XEl8lzesHo6rvf
         OmwU490VeB5GiL5UwOFm2peHsDkHWDCaBbjdWP/GQAtYKo43SCrOk0YkNv6zm3fOc7dd
         5hjzfFitLs95Z2nF/5uvSWk74Yv/wC7gcV7s6+NwuSWmMphEKJ/o3oFAWJnm4YE943QC
         CUZ4ST0l+29BOoaV1wSeXGYT/+NrFdbH+jsIu2VQxr05pfCrYYD/sERsbfkmfJqRcyNZ
         9uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784233793; x=1784838593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8n/qihM1wH8ZL18Ajd3REpJyisiDchT34om9j3flBi4=;
        b=KGfDRAbXI/9+PhEJ8PtGtob8B6SJcAi3huBW/gcIBelRYI7veE9BRlg8RVJtlUF5SX
         hF7Y7RNmQXlHbgsZw9pVA1fdCQsh9y2s1LoBoTEb7XWm4Kidz/qx6dRwriPgk3yuDuGh
         xxFbf7zgzZnwh9jGiWCBmUUt/qK2/Qdtpo5SGUXmqg/NHyfe4HAssOwxSiKq/8VaatZa
         qMpMU1jaCSJ2tHuyebqIgtntmDQ6MmpQvEFrx+qzGPUftfP6Tcu0mPUnTi5He3kfBRTA
         ZcfO/yayLFN+9l6JNWxDEqpdXi+QMYFcuku394x8zizFJTzutj1a173RWX660sQ5OR42
         kxWg==
X-Gm-Message-State: AOJu0Yw/thWfltndKx7uvVsiuTPaXNqhLs0aGMaafIuKVuFajNOm7CqE
	P6I9UgZMob9cHrwSyPeBAZ1pocfao1ok32KZHvXaR8vOUp8clv4cQcgLiN2xZw==
X-Gm-Gg: AfdE7cmzuuoUBTdH4vzyUxZRY04vZ5d6Up5h6iU8kdBIVzOBgg1lP34CDVLtcxmUMLL
	RwNGUqHAgriA5t4JFdedKz83tt0egFpN2Z6MJRSoUuDHA6TwV67ccUK09pOx1USSkI8rpM9eVeT
	hcQ5ZdhmHJimT2ugTf3CBEBmCJdcRfhIgY/KnTt8ByC0DnJoiII2YOgL47ax7JQE7pefP1Uw44g
	jKpWHJTJm2IktTbdH8NIJujtavcRphv2dTzjkU5tUEZ0hwrjvkSq1xNt+AWFEVa+YQEmEcmupe7
	P1aeGtgmqWHR/bzRNsjEaATjJ5RFZdR9gHLDClbfS4Het3SY2nMe0FY9jg4h81MCin4+ABZ6MSH
	9XLlsUBKiuPk+MmupISrksYmkP4VREWNijkzPRnS+3gSXQMSdFdDEd+xtp2XhA9WRA/ugVJ9i5U
	gir6i9K2OUrrmVmtESsKX/KhUOz9WnGn/K77lT0BSRgD0jttsyVIPfxSJ8w/9rQamElsN2dEwDC
	9WZ4OpUSFpK0R13XXk4bcWLHgAJ3yKQ7bpC0dNgJmJZSjQOb6zKv9w=
X-Received: by 2002:a05:6a00:460e:b0:845:363e:12d9 with SMTP id d2e1a72fcca58-84a554f93damr12435719b3a.3.1784233792515;
        Thu, 16 Jul 2026 13:29:52 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f26f703sm5536776b3a.17.2026.07.16.13.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 13:29:50 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 0/4] dma: fsl_raid: fix sparse warnings and simplify probing
Date: Thu, 16 Jul 2026 13:29:45 -0700
Message-ID: <20260716202949.677290-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the fsl_raid driver to address issues reported by
sparse and to simplify its MMIO handling.

Patch 1 fixes the endianness of in-memory descriptor stores. The
descriptor structs are handed to the device as big-endian, but the driver
stored CPU-endian values directly, which is both incorrect and flagged by
sparse as a base-type mismatch. The stores are wrapped in cpu_to_be32()
and the final-frame bit is now passed as an argument rather than
read-modify-written.

Patch 2 keeps the MMIO bases (re_regs and jrregs) as void __iomem *
instead of typed register struct pointers, eliminating "different address
spaces" sparse warnings on every register access. Each accessor derives a
local __iomem-qualified typed pointer.

Patch 3 replaces the open-coded platform_get_resource() +
devm_ioremap() sequence with devm_platform_ioremap_resource().

v2: split up first patch and simplify __iomem patch.

Rosen Penev (4):
  dma: fsl_raid: convert descriptor stores to big-endian
  dma: fsl_raid: set final bit via fill_cfd_frame() argument
  dma: fsl_raid: keep MMIO bases as void __iomem and cast at access
  dma: fsl_raid: use devm_platform_ioremap_resource

 drivers/dma/fsl_raid.c | 58 ++++++++++++++++++++----------------------
 drivers/dma/fsl_raid.h |  4 +--
 2 files changed, 30 insertions(+), 32 deletions(-)

-- 
2.55.0

