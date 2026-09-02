Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9302841686D;
	Wed,  2 Sep 2026 09:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341216; cv=none; b=m86tkK3T1/WSQD+oVscQXy6HfieGCj22UiBId9YeEjeQWc3gwyR7ohib1InkqjOGT96mily8HVch7penGlPmPyeO/q2qOIuc8ixnwuWbeUo43ELOC/+BsI9chkgdOaoQ+m6kTnz7Ziz4YHAsdHJLsFnH8Z0ul+QsHKbFRLc9xh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341216; c=relaxed/simple;
	bh=vudKrCt2pi32EyOqnCOef++ciLBI346w27KPFQcOYh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gqDmqFSSBV4dGsbIeWsG/0bx5KZEjyRdVeIIyojTC89xikBKgoNIs+izYBlreD9fa7c2vInKDnZ4FKG59KTahtVGlI0eHw+/tGDzBLhBdU86eZmPRgmK28BhYo7uKy4pgCD1dTytaaLjZaBpUNPUFL7Hvzk1inkQ8MgUEnCSh8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=opkmMOkq; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="opkmMOkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=RC
	HWLwGWJctJVA/Om+YIAobj+Q0Zrvo6QdReX5qZAPo=; b=opkmMOkqg1/mbPhLfZ
	m4z7mbr+gOqQixRooCkj07S6/7vV4ebzv/X8i0DCO+PdZnCGE8s6h9tu5OjkghDq
	5CdseVyXagyogzgTBo8+a/1zkahLjJEkpYrae5kOiE8JAvseZHQ/pFKcCdV41yMI
	ur/QurnaGAG/LatuJx9S1axR4=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDHQAfU65dqiy0AAA--.195S2;
	Wed, 02 Sep 2026 17:26:44 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH v3 0/4] dmaengine: dw-axi-dmac: Fix burst encoding, LLI
 dump and priority
Date: Wed, 02 Sep 2026 17:26:10 +0800
Message-Id: <20260902-dma-fix-v3-0-414c6449fbcc@ultrarisc.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALLrl2oC/12NQQ6CMBBFr0K6tqYdCwVX3sO4aMsgNQKmhUZDu
 LstRklc/sl7b2bi0Vn05JjNxGGw3g59HIddRkyr+itSW8dNgEHBSpC07hRt7JMa0CBllRvkQCL
 9cBjPa+l8+Ww/6RuaMemJaK0fB/daXwWeuG+1/FUDp4yqohKyEaVEJk/TfXTKWW/2ZuhIKgfY3
 IrxzYXo1rJhIq9Qay7+3WVZ3g70MczwAAAA
X-Change-ID: 20260827-dma-fix-c2b27795ce12
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788341193; l=2051;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=vudKrCt2pi32EyOqnCOef++ciLBI346w27KPFQcOYh4=;
 b=DAF/DtpyB4ookQ/ubxNvniHj2UvooXCiDslX9TyQ+bQICA791rprpKPcYaLhs/KvwtGZoNJY8
 YQcWxia4uAeBs3izt4u7wub8C9lRGG23YXiEr/+t7MGbHH/3cG7kXKi
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDHQAfU65dqiy0AAA--.195S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr48Gr48WF1UGFy5tF47Arb_yoW8uryDpF
	yfG3y3W3yrKr9ag3Z7G3WUZ3W8X3Z3JrW0y3Zrtw1YvF15Ar10v3s5Kw4fWr1ayrZ7Gr4r
	Kr45Ww1ru3Z8Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUoWlkDUUUU
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAYAA3su

This series fixes AXI burst length encoding, an out-of-bounds access in
the error-path LLI dump, and the CH_CFG2 channel priority field position.

It also converts register field definitions and programming to GENMASK()
and FIELD_PREP().

The series was tested with dmatest on all eight channels using
snps,axi-max-burst-len = <256>. All channels completed without errors. It
was also build-tested on RISC-V with CONFIG_DW_AXI_DMAC as both a module
and built-in.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v3:
- Initialize cfg_lo separately in each channel configuration branch.
- Remove redundant parentheses from register assignments.
- Link to v2: https://patch.msgid.link/20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com

Changes in v2:
- Use a loop-local unsigned iterator in the LLI dump helper.
- Add a patch to fix the CH_CFG2 channel priority field position.
- Add a cleanup patch to use GENMASK() and FIELD_PREP() for register fields.
- Link to v1: https://patch.msgid.link/20260828-dma-fix-v1-0-a6947f487e07@ultrarisc.com

To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Pandith N <pandith.n@intel.com>
To: Sia Jee Heng <jee.heng.sia@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jia Wang (4):
      dmaengine: dw-axi-dmac: Fix AXI burst length encoding
      dmaengine: dw-axi-dmac: Fix LLI dump out-of-bounds access
      dmaengine: dw-axi-dmac: Fix CH_CFG2 channel priority position
      dmaengine: dw-axi-dmac: Use bitfield helpers for registers

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 84 +++++++++++++-------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          | 44 +++++++-------
 2 files changed, 64 insertions(+), 64 deletions(-)
---
base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
change-id: 20260827-dma-fix-c2b27795ce12

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>

