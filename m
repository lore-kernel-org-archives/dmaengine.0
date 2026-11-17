Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894092;
	b=bsI6yaIeXlyD2Fu/2xB+gnGSEMfyYUFL/JC3o6ZtvBLgkWyBpvFIWn8nfWsNZx/eOwTy
	 qAbR/sK4a1qUaYl0nS6+HP24yUsbzp7H/e9RdPMeiEhKa7WO6HLvrb+ewcEZ4YDGwjmNM
	 BFxR10BleZqjVQ1NO/gjiH82XtAMYScz5PpI0z07c0reTx8fGNoFjSJs31XOtig7Ii5VG
	 KNxI9ZLcDgOeOQEjP5rMcj4uZPaKZ7FB8pNpZrJrzjTzByHU9LAO6Nwl3R+WAGjzMKKDh
	 JFWncTyhSxEDSl7LrZYrRlhPvDlbeFiH16mSsT2hkKX7/R3oVy1lKmMnW01hPXKq8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TXnRscLI+5p2iZDtjZSChWhyaXZPY5sKSAAfiOfGpTs=;
	b=hFPqZ7arIC+EOmAv6tHGUsxCBEJTFaPIvlUEOPVEMuTQzXT3qjxCR/YJ5NaG1F6h5MTV
	 YCOGGVPAJmDTcHcUWhhuayWL9rmnz1B7UtfbtEZ+POGEK9RkhTxbUg4ZzP82aXRhIz1PQ
	 Fuc1o+XcJ1eNR25zQ+5/0Zjx+CxNuC4lz3+5UHCGdKZCjDcjlwxWDzTUmpio1Eb3YxV9m
	 //7g0SIrKWrQ8eK2eav/WqfEOppF5IWUBVB8lGID0R+3BuXzCZVNqjqxtsz0VV0a/12ml
	 wYigkDqocdvyURWuS3pjB2TfieNgLbltIjStLXd0yGM6QExwBRlb8y0xSjX8VvMKSAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSawB1nA;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE0606A323
	for <dmaengine@vger.kernel.org>; Tue, 17 Nov 2026 05:41:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0BE0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iSawB1nA
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso43496505e9.3
        for <dmaengine@vger.kernel.org>; Mon, 16 Nov 2026 21:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794894090; x=1795498890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXnRscLI+5p2iZDtjZSChWhyaXZPY5sKSAAfiOfGpTs=;
        b=iSawB1nAf40dzs7ZN1+RTexY5htMcnLfQniuVkWyIpeqeLVSCcaBotb/94OvGvxaFd
         O1ub2Bof33/b7u9dieLD80J8pUtsta8heN66MOBQ/XSJlyCIiqY7eyTGONQM/0ftf1Ya
         E2vQsTZjyZMiBYcqEhU0ETRugiLCL+MsFwdmb0bSp8aiita7mKoPVucgvNJMKIoCATey
         1v+zm4cM9arBYTKv9gVgfzBBoAo4z0cbAoZVlCBI6Hfz96+I5kkZU0LCtb5SbtXMlb9d
         zguZ3cbkOSOAqSb3e9cPUsStck8DD31Jh/MRaMfdyK1FRJVw4YNlaYVLQS69iA7/X007
         j9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894090; x=1795498890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXnRscLI+5p2iZDtjZSChWhyaXZPY5sKSAAfiOfGpTs=;
        b=E5u9gtb+4oyVOs1Ub6y9lfzYVzkULg0fPYsehovQUjTUe5PrE0w4D87OI6G0mq0zKX
         GKnRZEltVNvQKDUk4Fsqc+8pSzGHnIoRAX7gB7fPVvSzb6IqxLe+QWj1gu/58JpeO904
         7Y4z74xb15qyRGuoYHQt2zawU/goUY6Mbr/iP8/ThWHh0o4Ui4f1IIjgM1ZJaP/BsLlO
         G7eV91B0uFuUeqRju/GwWKe/I5CxlzQkRh4Vq/x00pWfEaK8kqrW+0NsjNihuMknrCej
         tb9coMWeucCYPC4D98WkUhx2G+y5qNZACPgs39YpIqsbiT0PR42q3Jz4U4zHvh7b1Chc
         i8Aw==
X-Gm-Message-State: APuU4Z/tgoGKZVJ2v1AWGe29Rwh/DymZcPy8YmmxFAOwzzn5YglQYcKR
	lJLKcsJsdGDV4RQY2bcgMstgezPaGcjWItG0Kc4MsyF0wIWWtNfavPBtFj5gx6js
X-Gm-Gg: AYBFou0aRLFtDdyNFtNpfSLMXt8bKWfvykEpE8CAAtiPPM/9Z3pkDkpdbcMGyewAbdB
	uNN3wY8rV7xnr8MZoN5AoBwdHqp5wwkMLGvjBdo073hoVm17GKERm5tIDOj5zjnvKj8Ii0Payj4
	yTe/KKz9hcHmGrJd9te2TOE8e9xjbL6SOQgYadCYFXU5zKikKb0tNoApa3WFmAHpRXP8jGN+ZeK
	vp11yJKjaRtrLyYF6HvmtAQOK4w6yXT5ctXs9FDR4yyZba5b/yfQt4oDhxVdK5Fn1NVck3KD+m3
	NvkZI5HXsl7VKx309uU15xxIO+GKZwog8FHmvMs8ear0aD+8vEt39JCHH0vDIGDEOo6KLvaVGE6
	KuOZMJfFW2/XotoZD39C6HxCQWTB0y3n9q2f83hzFUBMSHeAMbCpb3GTFPFAjxp7w4LBNey9QgS
	tvt/6baFPMlG5KO9Q1ZX9AthiOdxf1RAv8OCEOIRHWGoeUYgxTM0kdNwnJedz4VgYc4hF+fVTWP
	fPXu/2jJjzXs9s598MFPqrxueFbImZgIDk7quYEMJ390PrdFYSudsPviG208b9PnurB2czMebZM
	D2TDn/XYE5y3ATAOXOaYRYrIcKZSiNY4lcfCJixa0ipg2Q==
X-Received: by 2002:a05:600c:1f96:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4bb55a4d2b5mr282862915e9.14.1794894089563;
        Mon, 16 Nov 2026 21:41:29 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb68c00b10sm125348055e9.0.2026.11.16.21.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:41:29 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH v2 0/1] dmaengine: axi-dmac: fix incorrect segment size calculation
Date: Tue, 17 Nov 2026 08:40:53 +0300
Message-ID: <20261117054054.22409-1-matsievskiysv@gmail.com>
X-Mailer: git-send-email 2.47.3
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

v2:
- add reviewed-by line
v1:
Link: https://lore.kernel.org/dmaengine/20261105131547.305510-1-matsievskiysv@gmail.com/

Sergey Matsievskiy (1):
  dmaengine: axi-dmac: fix incorrect segment size calculation

 drivers/dma/dma-axi-dmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.47.3

