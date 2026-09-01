Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B754C331EAB;
	Tue,  1 Sep 2026 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788243438; cv=none; b=eX8jUnlB0h5svtiFcmVlijBtrITOa7tndcJeMcWwKFlkNAtW7p0JYQCpjKXdwpOdyazy/978HLgbfKQTTreHToXAO+Teo9XmnCNz/UmfecgsmP+wW690gmSwnpt3i0AVW6bAwsl538eBX+Vb1allWzPO5z4acVut+zspWv3EpGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788243438; c=relaxed/simple;
	bh=FAQsbYvhbYP9frg4TnJp59EkIgCZqfcxzcXcgAzLSwE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QPmPDOCLlU5JJIfP38J01GmVHwOqwH3scz/3w5AS2KQJXcFrsgwRWCiuVjBizwJ9wC/xWtAgUbw3RYgtRcfeP3oyTYWwoU60DWL6GKPdbmWnWzTAgQ/zS6cof6XwjiKkMKBDEodBzqPeMCg9TfcNIzkrUSLFySFXuOF7DcfeysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=pass smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=ZCofaV73; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="ZCofaV73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=Nm
	BEVJW1T9p9chVY9RzeTu0LjEemRibAkN6FOWhFtZs=; b=ZCofaV73FevdaQPPym
	xRhGZX9EU7oIWCfW/Ac0+in2s38whb9IYbtNINGR/M0O1R9KEC0XOOBdVo8akTP9
	gSKDFSqzZX3n9mJ+6XGKD8HhUO/vE2mEN3skc6sVrUPkBkudVhswaW86uc4HIinj
	Fl+WTjVtDkZOdNKIDbk2aL5Gk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwbjbZZqXCAAAA--.118S2;
	Tue, 01 Sep 2026 14:17:07 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH v2 0/4] dmaengine: dw-axi-dmac: Fix burst encoding, LLI
 dump and priority
Date: Tue, 01 Sep 2026 14:16:03 +0800
Message-Id: <20260901-dma-fix-v2-0-d7f0459ebb14@ultrarisc.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKNtlmoC/z2NQQ6CMBBFr0JmbU2ZIC2uvIdhUcogY4SaFoiG9
 O4WjC7f5P03KwTyTAHO2QqeFg7sxgR4yMD2ZryR4DYxoMRSalSiHYzo+CUsNqhUdbKUIyT76Sm
 d99K1/nKYmzvZaZtvRs9hcv69v1ryzftV9b+65EIKU1aF6gqtSKrL/Ji88Rzs0boB6hjjB5gKW
 V20AAAA
X-Change-ID: 20260827-dma-fix-c2b27795ce12
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Pandith N <pandith.n@intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788243415; l=1816;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=FAQsbYvhbYP9frg4TnJp59EkIgCZqfcxzcXcgAzLSwE=;
 b=mj63tEVsF0HLsVijNixXO2C5gaWTnXdHB88Rdk2H4LOBwcPBt3ugq44J2oi2wwXI9sLhwLfE+
 VUhIqA7HGUyBcFSYKxBYP4G3Y8olo8AZut4rOwbtwODqvrDuDPgGSjY
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwDnrwbjbZZqXCAAAA--.118S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr48Gr48WF1UGFy5Cw4rXwb_yoW8CryrpF
	1fG3y3u3yrKr93K3Z3G3WUua40qas3JrW0y3Zrt3WYvF15Ar1vv3s5Kw4Sgr1jyFykGr4f
	Kr45Gryru3Z8ZwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxV
	W8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqeHgUUUUU=
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAREWqVJKMAXwAAsm

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

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 78 +++++++++++++-------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          | 44 +++++++--------
 2 files changed, 60 insertions(+), 62 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260827-dma-fix-c2b27795ce12

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>

