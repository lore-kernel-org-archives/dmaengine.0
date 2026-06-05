Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103563815CE
	for <dmaengine@vger.kernel.org>; Fri,  5 Jun 2026 22:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696915; cv=none; b=Ew6sXdNb+5QHYe/Y84O948xGqg4Yoc+8gEqa82S5SDqKgnm11fJ/MnV5nj0QGa6njouxLmSRaEHskITtSFG3HiuMGfoJU4cnfsnrnMOXNvsFjYkTn90KtPhK/D9SqnnwAgsqDFSzgp834edKgIG60R7mzjQmqdcleBPcOPd/uA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696915; c=relaxed/simple;
	bh=ngmjTppZ4R8OgX4SoxvBD/WHaDhJUoUg0fzo0m51EWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=biiTmWn1U/FX+qaVDkK7LCVk0M+vGSkSisaJjHNHrPYZ6s/xxFpyTXO9zfRYeOkKjp+5NZxs9LqqZO1miZafxSv6Hko5j2xSqV0NxcsNFBEa3Rg6sBrGSGseBKVMd8Mc5BA8jUXEdzxPZu7tOu8jWfmKAyjCUJkBcTpDbvhUWOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHwZ0b4+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHwZ0b4+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84237c55ef9so1244810b3a.0
        for <dmaengine@vger.kernel.org>; Fri, 05 Jun 2026 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780696913; x=1781301713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jPyXiBEaDClQK0uMOGkx+P1/d3TAmzFQ5qeaXXNxnLk=;
        b=iHwZ0b4+Ecz5V50Xt0F1DG4uPV9duEitu6V9CpCU7eSmZDQVxSqa3SpJI9B71avYYw
         jm0AVvWp9P4KJAeBzVgjVh45BtWK5WFfWxZZJM6NJMjtse6Ku620bx//Mc1N33Y5yiZJ
         o4HJMBGrDJ25JSQXPt/IxGHB9XCGGlab+hXowJtaAT0Ql/BbmrEVrMKDnHgiBRaYM7+c
         x2UdyJVVonSZzQL8b/TR5hs1YlPFQnV1EYHCon8vcV/64jYA/clOkfAiMbZaixLN090j
         hY+qY51XifIKSZJveAeeyXZH7QvTBK+/LgHCf5zPp62skJkInfMfOIOQJ4k/YoLNQJMi
         865g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780696913; x=1781301713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPyXiBEaDClQK0uMOGkx+P1/d3TAmzFQ5qeaXXNxnLk=;
        b=oDotzkjPNWI8xF8sIlihx7BG2bw8Bewt6Y/qLjwOt8sQiMRS7NfSVgaDHk6+uMufnQ
         TCXUCF9FpMSMRH9VXbE+hyeKlUernLhpjNzba53c0SMJgmvWRFYbEqx7tEoYVYpWZtKq
         x5XRcvaTJMidhFbCjB56xas41Jt16kX+szi8J143vkNRG/f3wTF7STNLx3QsZrRdO4Zc
         CX1JEQKlHOcoZJKKz3ZeS8yXx0DpFza66k+ky2CV7l9jnQ2QFjKgaVtYNYMZRH/VK2ag
         A7T5/WTl3omWx23U1OHQShacpKub5oPgDGJ0hKIQ4/hgBUyK57NBwK2mLAtXkjjjh8DZ
         NH5w==
X-Gm-Message-State: AOJu0YyjvdFofdWarH2L8MjeGaLsAo3jpeZHVGd8jQUEnHFTtl4RFDtq
	QdwZne6u87k2OE+VI5rw5muwZ/RGKpU+5Jfrf18bd3rbY1rg3OycMHgDgfL/Ug==
X-Gm-Gg: Acq92OGq4ZcH/MjMCZLHDW/lnbu6ozTFT5BudiCkdpGsSnANeoCT07t/4Caa3LjiBMQ
	i2e6+X4oXS4TJX5BvMBEayfiGBwjmn9OZeAMvs5Mtc6FhY59qtKTKPRM380H9yQRj+OEXMimZVj
	xEt/EferptifusVwhCbwbbOvcKchY+y9s01bLMr6HW6pUCvPmqPV9jG7QkLjDjqCBqC2HXPzFgS
	yUktPYF6OoYeNcPZWR0mjKL6sDVXb0V4USJhdEfafMnYme2RvVGwo3182LBy7FoohX5tK9cxsta
	W0xlzar27Woie61m6I3ZgkuIW4charWufpyylylSvEWEQe9Dq0S9OVwDgY0QJj0nBjtQoUhRsRn
	nvUq5wF28EV0RHQy0LHKDScoyTZA1hUwBiZFF7FO6DN5K2BmZKU+dNhFy0M8aKw8udabZB7jaJm
	fxSejTLyu1C5Ws8ENjZH4mCurk13VASzYq2d6NzM6im6j7GkiIKchioOoPPrbxGCccsRW21kGse
	WkjUgyODlSKvT5sF11dbot3lppXVQwJOxtZlBFD+sNHi79bjq6Dy+dT
X-Received: by 2002:a05:6a00:6c9c:b0:842:5b63:6118 with SMTP id d2e1a72fcca58-842b0f1f43emr5730143b3a.3.1780696912990;
        Fri, 05 Jun 2026 15:01:52 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842824a1cb4sm12518883b3a.26.2026.06.05.15.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:01:50 -0700 (PDT)
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
Subject: [PATCH 00/10] dmaengine: fsldma: devm conversion, fixups, and cleanups
Date: Fri,  5 Jun 2026 15:01:24 -0700
Message-ID: <20260605220134.43295-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Convert the Freescale Elo DMA driver to use managed device resources
(devm), simplifying probe error handling and the remove path by
dropping explicit iounmap, kfree, and free_irq calls.

While doing so, fix a few issues uncovered along the way:

  - Kill the channel tasklet before removal to prevent a race with
    the IRQ handler.
  - Check the return value of dma_async_device_register() instead
    of silently returning success.
  - Replace the powerpc-specific I/O accessors with portable
    generic ones so the driver can be built on non-powerpc
    architectures.

Build-tested with LLVM=1 ARCH=powerpc allmodconfig.

Rosen Penev (10):
  dmaengine: fsldma: kill tasklet before removing channel
  dmaengine: fsldma: check dma_async_device_register() return value
  dmaengine: fsldma: convert to platform_get_irq_optional()
  dmaengine: fsldma: convert to devm_kzalloc and fix error path
  dmaengine: fsldma: convert ioremap to devm_platform_ioremap_resource
  dmaengine: fsldma: convert channel allocation to devm_kzalloc
  dmaengine: fsldma: convert channel ioremap to devm_of_iomap
  dmaengine: fsldma: replace irq_of_parse_and_map with of_irq_get
  dmaengine: fsldma: convert to devm_request_irq
  dmaengine: fsldma: replace ppc-specific accessors with portable
    generic ones

 drivers/dma/Kconfig  |   2 +-
 drivers/dma/fsldma.c | 139 +++++++++++++------------------------------
 drivers/dma/fsldma.h |  35 ++++++++++-
 3 files changed, 76 insertions(+), 100 deletions(-)

-- 
2.54.0

