Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB6E3DCDA2
	for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 11:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090490; cv=none; b=h9wrAqHgawjdZqnrKlF72z2CttIdW+y0tQmhewv+jrARQmUnwWs2WlW0I1w+Bk+N4xlY6C4rcwh0WxYsEkR0eSTAtj7X+j06BJ+Vzqi0CGfhgB+2k+zBxFrlZJxYV8CpcFeIPpAaOE6WMx0N6cyl7amjqwmrJHg/VZO8XHJtxwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090490; c=relaxed/simple;
	bh=Hxf9AQn57LX9pKlw/g2S5DXs1l1DgwWTCg6QyNsaMls=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uyuYGLade36YHhyW8OIt/Zj0NWXTouAx8ScmsMN/EO9RtJ7OC8nRQ3DWB9mEP24zo39TfJmvnPc/H5KUH7IhVKHjUgvHq51wgRwthynbcoxN292DHo2VrRmA6lHD+VUl7PkTIlDo3JKSzTl6tcDBHdjQjfNSkhBUsg9m9zJ0jRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=Tae21Byx; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="Tae21Byx"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842307473b5so4558856b3a.2
        for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 04:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1781090488; x=1781695288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZG5BwbtYHGG6HeCwLlOe2PoqcDJLynQJ4Ahip6IECQ=;
        b=Tae21ByxLJFogSUkr1wd33pkRu4SYzKJrcL5mrENlEZt2coxpoRbSoznkQgvCMbMk0
         GYVTMkJL6dS5h8bYJIHigpC/RGZQsFA/dbHqFeAd9R1yB9eKaOkaWK9L6ZmnHl6ICBhv
         dRQAO6vtJ0LckS2q+GXP9PupNwd1mhYVTAXio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090488; x=1781695288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZG5BwbtYHGG6HeCwLlOe2PoqcDJLynQJ4Ahip6IECQ=;
        b=K15uK/tNe/KvuhUplwvjJYMdZOSKtBrRVGgwnVzhLIp20+BKQlWmSZmBk5nIcMxXwK
         AvnbVpBPyio74DQqF9/aw558OORniSG5gS7LBdaPNFDCe6hWGu23ZqpxjDHmuxjk6bpA
         SWXuo53QmZpRAihAMp960GX4ZPcIwKev2HII8pewSGgxV6iwkGfEk/SSrqauUp2HyZwh
         i4jE7JRr9qJbyJ3ju26bwlhWJmpTrbzo5PUUAIoxCEvpokzgaYatdTXGjRQxlg2d8H2P
         z5jeZqXRKD7H9yXwU+jtaXdgCpYKQa0lf26EESiiQ18ifBpkzcy4mpgpKGzylP7w5/gM
         j+0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8soFtMN0uFVE52XHrhTilmH5z57hyn9a3KERMnXeXBE3fK+qZzutbjrdGlhhHMncw1+qVjc+1PWtU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMRjKSFP7jmi9NZUzJgAB2C/4Z/xjnXpbUt6udSouwpmWxY4G
	R4+pCVkl9W8EQOfUIyblCcHMWplFZoLk8SJwIMOc8lN/RR+HwnoGjHo/13vCNT0J3kU=
X-Gm-Gg: Acq92OEOhpd556lIBbFgP/oTakSXyyGGXBDNUs4SXkldBpFQ6ZymC3P8jbQ4XYwn872
	pM8XHBTl6aG1Mnr9Z3ZM/lbbe3iraslWS1fUhcEZVTnxLCKfzueGVeOKw1ntx6g3u7/GC6rlHT+
	xG1BBByIlOUR7ZHrLkiDczuLLh6Ihd7lEBsCgnk/sf42Ip5GvvNhCbalOyGKcIPq8jZF0Ycam1F
	LFDSdkpk+wDrvrqPMiDIO0RZQVqwzBT6kmfZppdztlUZNRwGEt59b+ymRNrwXTrHLKCjybWSSO0
	OIqr2tp61hdijZiY8ixuLwupEzooMNRBuvK1Yna3qtH8bEGBZCLn0oqhVJGLhTjJQeP+pyGV++x
	e1pf+eF8HRIeNUfviJcmT0VFIF+9a0msefEhgw6bKY6n1+54D/spJmc4X/chevLsNytq+dInvEe
	v+C7ylGEss8b/W8IjGdsnNejhVvhYLA3MGgyLxEpEdmMCQhAmMX01y4+HF+/Dt4RR0VSY=
X-Received: by 2002:a05:6a00:9292:b0:838:1c02:276c with SMTP id d2e1a72fcca58-842b0e95c72mr25824082b3a.40.1781090488197;
        Wed, 10 Jun 2026 04:21:28 -0700 (PDT)
Received: from nunu.. (nunu.snu.ac.kr. [147.46.112.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm27644305b3a.2.2026.06.10.04.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:21:27 -0700 (PDT)
From: Jaeyoung Chung <jjy600901@snu.ac.kr>
To: Logan Gunthorpe <logang@deltatee.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Jaeyoung Chung <jjy600901@snu.ac.kr>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sangyun Kim <sangyun.kim@snu.ac.kr>,
	Kyungwook Boo <bookyungwook@gmail.com>
Subject: dmaengine: plx_dma: KASAN null-ptr-deref in plx_dma_isr() on early IRQ
Date: Wed, 10 Jun 2026 20:21:21 +0900
Message-Id: <20260610112121.676561-1-jjy600901@snu.ac.kr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

plx_dma_create() in drivers/dma/plx_dma.c registers the interrupt
handler with request_irq() before it initializes plxdev->bar. If an
interrupt arrives in that window, plx_dma_isr() dereferences a NULL
bar, causing a kernel panic.

The probe path, in plx_dma_create():

    plxdev = kzalloc_obj(*plxdev);          /* plxdev->bar == NULL */
    ...
    rc = request_irq(pci_irq_vector(pdev, 0), plx_dma_isr, 0,
                     KBUILD_MODNAME, plxdev); /* register interrupt handler */
    ...
    plxdev->bar = pcim_iomap_table(pdev)[0]; /* initialize BAR pointer */

The interrupt handler, plx_dma_isr(), dereferences bar without check:

    status = readw(plxdev->bar + PLX_REG_INTR_STATUS);

If the device raises an interrupt before plxdev->bar is initialized,
the handler dereferences the NULL bar, triggering a KASAN
null-ptr-deref.

Suggested fix: move the plxdev->bar assignment above request_irq(),
so the MMIO pointer is valid before the handler can run.

Reported-by: Sangyun Kim <sangyun.kim@snu.ac.kr>
Reported-by: Kyungwook Boo <bookyungwook@gmail.com>

Thanks,
Jaeyoung Chung
