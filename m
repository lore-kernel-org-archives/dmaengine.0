Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989095;
	b=NTRuk32XwvLuHrk5VN+2H7qw08L9ISszcDTsPzRQHKoIESwTbhCqmEDs/oYdW3faBPvr
	 W00i/yQtwVmUKJLWzUzMQMwQf0AowMuCJwk2E/rKctJ/qOchitz09Hg7SaOO/BaSHd0Ot
	 IBnzLTqRyhrOFRlRtgZvOmlqZywwoP/cJCHpOB9E9AJGVjC+nlQX4WeE1XUf62zR4mlyd
	 bWRBsOOpSUH84W4DlBUEmnq7Hd7cGmla9m522lEuyTimbijk5pKveeTnmCcpHIKRXQEoY
	 DtdsFd/TmzyaoxN5fs+dF4iUs3ElqJuqmJQr9dnetdMTbcSgrpgNPUJH1UztiZZusww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989095;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=7efESmXQRXOKsU4q+RY+I8mql7lhNDcnar7TApQ4pmM=;
	b=jdgPRuLvUrTiK9IqqfnPPdd0pS6I5O9NuVsV+/pNeh0pnxHbgDHY1FgGfD/wdO42f/pW
	 lErFh2hCxcnqKEKkUixmH/4lv4Vji9i95ia6DwQw4zqKl/6TV71mH8NruciToKXTA6X7A
	 P/Q58xuLym2qP3mZ3yrP/mRexbATHKrJXBXobqV5OSsWsp7bI3cusPfJX64vpqZ0N90XG
	 CYEY8GnDy3d7nOeQTgVap3i0ovRLL5HhhPsy2Y8Avk+cguXNjULtsIn9NuxZnctnIgQFg
	 hHKF2NWac9GujBG9DfSKBr6V8WSQFPgMhfgNSYINpaIe/AIJpTSVEocj1rs7oqai7Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDA9606A31B;
	Mon, 26 Oct 2026 04:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FDA9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.17])
	by gateway (Coremail) with SMTP id _____8BxW_Ci195qa10ZAA--.8126S3;
	Mon, 26 Oct 2026 12:31:31 +0800 (CST)
Received: from kernelserver (unknown [223.64.69.17])
	by front1 (Coremail) with SMTP id qMiowJAxlMyh195qoTgwAA--.8141S2;
	Mon, 26 Oct 2026 12:31:30 +0800 (CST)
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
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	devicetree@vger.kernel.org,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/4] loongson2-apb-cmc-dma: Fixes issues and pause/resume support
Date: Mon, 26 Oct 2026 12:31:19 +0800
Message-ID: <cover.1792988985.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
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
X-CM-TRANSID:qMiowJAxlMyh195qoTgwAA--.8141S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEMCGretPgBXAABsg
X-Coremail-Antispam: 1Uk129KBj9xXoW7Gw4DXF4rGrW3Aw18WF4ftFc_yoWxuFg_ZF
	yjvFWIqrWqgFy3tay3Xr18ArW3ZrWDW3WakF1Yqw1kWw1jk3Z3Jr97Zw15uFy7Xr1xZrn8
	uw48uF1xAw1FkosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jFfOwUUUUU=

Hi all:

This series fixes three bugs in the Loongson 2 APB CMC DMA driver and
adds pause/resume support on top.

Thanks.
Binbin

Binbin Zhou (4):
  dmaengine: loongson: loongson2-apb-cmc-dma: Fix cyclic residue wrap
    NULL dereference
  dmaengine: loongson: loongson2-apb-cmc-dma: Fix residue for queued
    descriptors
  dmaengine: loongson: loongson2-apb-cmc-dma: Program CNDTR when
    advancing sg
  dmaengine: loongson: loongson2-apb-cmc-dma: Add pause/resume support

 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 134 +++++++++++++++++--
 1 file changed, 124 insertions(+), 10 deletions(-)


base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
-- 
2.52.0

