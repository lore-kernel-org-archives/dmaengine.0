Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9367B379990
	for <dmaengine@vger.kernel.org>; Wed, 10 Jun 2026 06:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781074677; cv=none; b=V1O/NAThiAiYfvk6iTzpV73NvxhZJbOeTvlVFrym0QwGB8LGLsNt20eJVlBFSR4c5lGsN1T1qroCOIjgCB2WAYG9w1jbohLQYUCRoGFzeM++UgHY/Zy3vnI5pd0/LAEGEFqtfrZ/JqdvYvXt93YvRX4JoS7ZKpgF6hcdAMS2Hw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781074677; c=relaxed/simple;
	bh=XPasFKQoOQW2lVcbur63QZKo458ocN2WyfH+Oe46Low=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rs5Hy5sh16vDAQaADQCEFpNmb5SRlsdUvGlXDppiKoVhfEydCB1N2SZVzsLHZXhGhQ1YZugX36usY1dyutpVw7HOH95tX7zuj2S5BsVT3QzJ7tKn5JtVwjIo3jVQZv54rk4mwP7hZ9yAHEME9jiu8mU9X74T1lx1lAKXcnAW0p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfyl3fcB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfyl3fcB"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so4596668a91.0
        for <dmaengine@vger.kernel.org>; Tue, 09 Jun 2026 23:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781074676; x=1781679476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ENvUm23XMLkz5oIr/wZKCTGNs7jFOmIpUgctCJWrqYs=;
        b=jfyl3fcB0K2tJe7hlsJd0FZRRuYu9+M7a20rLNIiOmWdOJl5ZLQ8RDO9tXSHC0X9Eh
         mQJVoZwOg2RP/8StJnVnzD+uDB6Tzx0rYT5Qg/uOKeINTraQaD3nIYM1889nAiUw0/WG
         MfZp50xTpXy8KzK25jofV6l2wDdpWcLTbqV7z9wIVpCm131i54yGdmDQNAugbC0l1NYK
         tds/VWUTj7Hl9JUz27oXXEFkvDLSMyFDKqpvXYWC2Cb32Nbojdj4C5ZuFYGvPuPR/ItQ
         ebL+KslOypqjiMxd0i0dzoF5RfBG4yioLv5PHiR6Twsain7OMrkEubdKlQz9HWabBPaj
         x71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781074676; x=1781679476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENvUm23XMLkz5oIr/wZKCTGNs7jFOmIpUgctCJWrqYs=;
        b=IsS9Ki3Z+3e1a/cZeXib6RJw8KGmpKPngjyiWXlsXvoUb08k3Jn1XFX0Kvf4k7qPI8
         09xmTEAjizKLrjMIlWNtAEzcidbBxvK6OvhshjxLUZ1CaN/rUnmfXZMtYjuNZFN3GR5d
         44WhdrYdZ3zQU+QTBVdaPjgjiYTmFmOwtKvlVofeUR1U14c9LWIZpsZZpgh+IATzJ9RH
         ZgGO3d+Jk1YSIGwxcw+shJfRWBBcpAHu5Xh/Sv6S4/xi6ezWqBe4MFu7FQzU/CKX4gjb
         YjbpDpe0WXiR6oW4f07e7+ZEdzm/u6vrWz4vkTOwjbPUBrtWc66KJfIl7wNTWW31v3wH
         8fbQ==
X-Gm-Message-State: AOJu0YwHlwnOZMAp11mvkh1vL6hta4T+mTLtFj27XDDcvinD8m21A7MC
	Nxcf0Pyc7/i66YHn/bMy1ATflREVUjAxWqsXSVESu7BHCsdYw0fF891CCFTmqvCi
X-Gm-Gg: Acq92OGVQpyICTvtp3hz7XWgCv/kwm9uvSuShgIdS6qT28OO3Y2+yM+uy+CqNO4YbMP
	vgGvXyINQREGjocmwl/p4FCRT+nukAAq4WDjgsr04LYRMBksWUtd4rCy30DPSOKGS3anWT4XagC
	eGPoZaRzttqIRgXHXlZGyWYO/PFX4zvGIxK01rDVbDOYkwkSclF5NVJLSL5mFHl481uWHQn+5Fw
	JRITsgcgJcmqCwjWRTCIxYNNQAqgHVG/r2R99R4woQjEfFwxeyB6OBzVQfN0u1fefF8vZJckYNp
	kkV0NXLUKaUb4X/0YroSwrxF5GJn5OvmF7sa9i0yDX7ES9FA8wwDWqeXAfKRxjt2KGvi2c32oEu
	YY97LHyFcLB0N7oD8WOEFJe1xBqzT/909aycN5BAFkAQYAa+zCg2U6ZBc5vRToAYUPa5h8J54zW
	XOGszFX+7ahSio7q4SMh4586g1tV8XhRWHl8lWj/NqVhK7aogXvxG1hoHakQQ5Yx5MfLbUFtMPw
	MflG6tjfUhYXY48agpC6aSFN7vipbLyHc7BjS6glUeseA==
X-Received: by 2002:a17:90b:3f8b:b0:36b:9798:4f68 with SMTP id 98e67ed59e1d1-371323bae16mr18962153a91.9.1781074675740;
        Tue, 09 Jun 2026 23:57:55 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf830b2sm20064781a91.4.2026.06.09.23.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:57:55 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] dma: mv_xor: convert to devm resource management
Date: Tue,  9 Jun 2026 23:57:34 -0700
Message-ID: <20260610065737.118211-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the mv_xor driver to use managed device resources (devm)
to simplify error handling and removal paths.

Patch 1 replaces the open-coded clock acquire/enable/disable/put
with devm_clk_get_optional_enabled, eliminating manual clock
cleanup in the probe error path.

Patch 2 adds the missing platform remove callback so that
channels, DMA devices, and IRQs are properly cleaned up on
driver unbind.

Patch 3 converts DMA pool allocation and IRQ requests to their
devm counterparts, allowing removal of the err_free_irq and
err_free_dma error labels.

Rosen Penev (3):
  dma: mv_xor: use devm_clk_get_optional_enabled
  dma: mv_xor: add missing platform remove function
  dma: mv_xor: use devm for dma pool and irq

 drivers/dma/mv_xor.c | 51 +++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

-- 
2.54.0

