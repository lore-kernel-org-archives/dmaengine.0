Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CDC455630;
	Tue, 22 Sep 2026 09:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790069175; cv=none; b=Wh05nG9eH2xaAVdPPgdEUKLm6gPglH2G+K5mE7UoqzdgNFQKmcbqFntsNgM5G8HbXsFMjuwvhIyFwltBPh1Zibk8uAQkYR+25Agk6HuYJKFchEkJHl0ePcD2IVoWrz8R4mCbDHaVCymYgn3LyBnKqqj9MNFjkHKva47ESK3GflY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790069175; c=relaxed/simple;
	bh=5VVSl5kEoe00SoIyM5SbpQBKK4Df8IkKxZjS5IWulKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzrPoGdH/uSoFC/fzcvp4jLnKZaTHk128MdSqEEojLUaQsL7Cy46bCe3PzxK/p5gfuHaUqy9fuGCoAwn89dHUVMaTXIcBhsfnxP+IqBjIq/1JnldlmAziqwRh8yXtRH3Wdxcsy3YGyOzaJDztpDCL1/VGNOXQ2Wb7CFFuPH4g8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.159])
	by gateway (Coremail) with SMTP id _____8Bxn9GsSbJqNpcOAA--.42293S3;
	Tue, 22 Sep 2026 17:26:04 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.159])
	by front1 (Coremail) with SMTP id qMiowJAxmM2qSbJqWbUjAA--.9386S2;
	Tue, 22 Sep 2026 17:26:03 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org
Cc: Huacai Chen <chenhuacai@kernel.org>,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/3] Add Loongson-2K0300 APB DMA mux support
Date: Tue, 22 Sep 2026 17:25:41 +0800
Message-ID: <cover.1790068409.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxmM2qSbJqWbUjAA--.9386S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAgESCGqx8fgENQABs7
X-Coremail-Antispam: 1Uk129KBj93XoW7CF1DZFW8XFW8uw18JF13trc_yoW8Wry8pa
	ya9a93KF1UtFy3Ars3JFyUAF1rZF93ta47Wayaqw1UJasxA34qvF1jyF1jvr47Cr1xXry2
	vFy0kFWUGFy7AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UE-erUUUUU=

Hi all:

Loongson-2K0300 integrates a CMC DMA controller with 8 physical
channels. Peripheral DMA requests are not hard-wired to these channels;
they are routed through the CHIP_CTRL13/14/15 DMA_MAP fields.

This series adds support for that DMA request router.

Patch 1 adds the DT binding constants for the peripheral request IDs.
Patch 2 adds the DT binding documentation for the DMA mux.
Patch 3 adds the driver, Kconfig symbol and Makefile entry.

The driver registers with of_dma_router_register(). In the route
allocation callback it validates the <request> <channel> <flags>
specifier, programs the SoC-specific route register, and forwards
<channel> <flags> to the parent CMC DMA controller.

Thanks.
Binbin.

Binbin Zhou (3):
  dt-bindings: dma: loongson: Add Loongson-2 DMA mux request IDs
  dt-bindings: dma: loongson: Add Loongson-2K0300 DMA mux support
  dmaengine: loongson: Add Loongson-2K0300 APB DMA mux driver

 .../dma/loongson,ls2k0300-dmamux.yaml         |  49 +++
 MAINTAINERS                                   |   3 +
 drivers/dma/loongson/Kconfig                  |  13 +
 drivers/dma/loongson/Makefile                 |   1 +
 drivers/dma/loongson/loongson2-apb-dmamux.c   | 380 ++++++++++++++++++
 .../dt-bindings/dma/loongson,ls2k-dmamux.h    |  56 +++
 6 files changed, 502 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/loongson,ls2k0300-dmamux.yaml
 create mode 100644 drivers/dma/loongson/loongson2-apb-dmamux.c
 create mode 100644 include/dt-bindings/dma/loongson,ls2k-dmamux.h


base-commit: 0a8dda0a15d3926422d286567f945a05328a4ac6
-- 
2.52.0

