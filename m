Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2771D2405EC;
	Wed, 12 Mar 2025 12:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781155; cv=none; b=Gxtr8j/5U0zCmr3Kulm5eDdIez/WC/P38I3BP//Ww0R+ldJXmOvWWMHSfDLUTjgFz6R35aSqjP/it5JH07HhvPgh6a/wE4IppYZuDkCxAGK+YeIApk+yuV6QrSpLa/kCJPIZuJrliErNifCuLaGEAQTcrP1JFXr8LgI8YjdUF10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781155; c=relaxed/simple;
	bh=wrwLCLiVh25dABfs3Ebolr7ISR0I3YMnLZJSmZa2uRw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cuqyM2amF1Fio7DRnjKjXeo5VnKYEYKGr3HIZgA/Aw8e0QAF/djXlamd2XQPBc6aCEn/ARi820bTZB8ZZHfOFed9rjjwVNYKJS2mrL/ArzPuMxpetDxGu3wkSTNIU1aR2g1GwTrATCgDpPOIa99kBjBTXFED7jPpksf4JvE7ZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A4E51063;
	Wed, 12 Mar 2025 05:06:02 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA6F43F694;
	Wed, 12 Mar 2025 05:05:50 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: vkoul@kernel.org
Cc: devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] dmaengine: Add Arm DMA-350 driver
Date: Wed, 12 Mar 2025 12:05:08 +0000
Message-Id: <cover.1741780808.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1: https://lore.kernel.org/dmaengine/cover.1740762136.git.robin.murphy@arm.com/

Just a few minor tweaks for the issues flagged on v1.

Robin Murphy (2):
  dt-bindings: dma: Add Arm DMA-350
  dmaengine: Add Arm DMA-350 driver

 .../devicetree/bindings/dma/arm,dma-350.yaml  |  44 ++
 drivers/dma/Kconfig                           |   7 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/arm-dma350.c                      | 660 ++++++++++++++++++
 4 files changed, 712 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/arm,dma-350.yaml
 create mode 100644 drivers/dma/arm-dma350.c

-- 
2.39.2.101.g768bb238c484.dirty

