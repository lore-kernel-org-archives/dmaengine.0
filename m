Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC63739794B
	for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788218621; cv=none; b=L9AfQAN48YGdMbp5JwENkKs/dRn45iSF4qqw/XrUIElFh11dH/OZzMwkSjC149SvnUm9t1XvUNg/f4t7GH6Dmw9pjGe77KV+ej4PwHJnsBZzVxYoA1ublgaI5drpRVA7BkhKyABAttHSoFpW57gfeeAzdphxA/clmiUJ6Zzmlbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788218621; c=relaxed/simple;
	bh=lhiU6/DDjvbnzvWKv8+M0o5FcxAg1VP+aI6rjwrIbvw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OrTjQoBSzUxZZ2EJC7IjCZVdoLa+53Wzf0pCjwZPbm4ea2ZftDSoy8KOdQPTUktadijEnTrLUT1QTFujdeTZfq7VUvTSbKKMOqJ49o997p3BFRGB5nwSCMSn2hqHSE7QSvtfq20nxZcf6X7Zdtc/2w3SOuX3KPI6c19LiYJ/zCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGXgTqXp; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGXgTqXp"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso795162a91.2
        for <dmaengine@vger.kernel.org>; Mon, 31 Aug 2026 16:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788218618; x=1788823418; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1wPQaEPiJFpIFKFk5jJg7O8BkD1EI/fdnyjnPPYqLy4=;
        b=mGXgTqXptEEojfRQGJybiYB7GxZxudJ5EMLdZO0mHR/dR0j3YNtzBljzsdkCbKG2H/
         iteIpTVjfC9TR8mZsYcIgwAzXWkgHlFhT5v+cG8L/ee6w0YoJw5oIZTNfOFZOTc67ffK
         KPENZLZIWeb0QHF7QTYMg6gvNR/B6+5udXjjOcWOGGnt6L6KFlnlu/j/x6jEjVCUpZ2s
         tB34ib7QjIee7qsSduY0dIXq4dlLzqYlDNsjq+phqZY2kHdviRD48YFNQxQCD0XzktlS
         XOwVCXboDbvjwC2rvX0jSKM6mtIhr3rasE16UR67iTBA7de7HrNXHpykOJfACT2xgRPU
         E8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788218618; x=1788823418;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1wPQaEPiJFpIFKFk5jJg7O8BkD1EI/fdnyjnPPYqLy4=;
        b=l1IUF3Ym9yxmMpr2Z/j4MepzkkNCxS9yWZdAMfsJQlIFDvzqW4Z5CO6ERHY9xkqnoJ
         j/mqwWp7lgKuPaZpyGjzHF0UYQd+4rAEmkVg61WCN0JI/EDAu+fUEpbcwS7KAt1CrKep
         u6jn0iVnqmX2Eg6rOraYKyXrXsAyUU5ew0K8W4fUK10JlOQ17z/7ZmxI4U8j2zen/RmA
         YvYY4i+5f0oRzKIPw4eF58EylXjM//da4AKwe6EQ+JL5ertmiki/Z0f4BEaemVNztXdY
         1XK3RufvnnxfC62iW6N4UnOFszCi9DxVQhbfX/EiuXMXURQgz04P/4fMdQ5ciKsTxSyP
         7AQA==
X-Gm-Message-State: AFuF++keFaT8OO9m6+6uzfetAd9rqZ5OIUjLba4DC/KbRuc92Sw1nxxd
	cIfCTG3A8+rAdrtNZJVCGi2VBIXJyzbUiC+ZSDCK0ufOKITFaMkeyZTY
X-Gm-Gg: AYBFou01/P9Lt2j6/W4AGqORWCi1LrIvNubVuCFey9ekgq0iew/2bpZlZ9bG3FyR5iy
	ljHUoU+X+cnmPbd/XtzRxMhPNwo6ybjwyNQgM7rxp/v96U7PeoAj4kak5o5/M1avrIuqqpr4wuw
	ZFkzxpdCNG/t1KpnTGQqcX+cArY8T9MmAro9iVOvm7bf3mAhcTEcNCty4vOuh2RBaRdbxFZIJJX
	b4tcD9eCwlYqh05IRZj8WSSMP0tf66biwg0pjKm3ex12GMknxNf3Ms0n1/DzC/zENKHaBvCilyW
	hvn2NuSUMyxIcunjLfW/3V3Pv6ii26foMmK8wd3Bv14rRP0KfRa7Up7VsoUmjMMHpnEdE0WuD/M
	9hNEYucWnmIWija4LYy5Y9mangYtvB9sbYhBACkZDw+gU769FzuSNk0o1Av8ZYM6Hc9l+txGqiE
	R6QwP8yIUydDxD05GmiLYzpU3U17QVYHGT81lq4n7F6+yk0H8KgZKzRlCMguaVQMYfYtqPpVFBQ
	6nVV1kACA==
X-Received: by 2002:a17:90b:4fc5:b0:396:63a8:699b with SMTP id 98e67ed59e1d1-398ba94e732mr16798419a91.1.1788218618239;
        Mon, 31 Aug 2026 16:23:38 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm1963213a91.12.2026.08.31.16.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:23:37 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v3 0/6] dt-bindings: usb: ti: Convert AM33xx/DA8xx MUSB
 bindings to DT schema
Date: Tue, 01 Sep 2026 04:53:04 +0530
Message-Id: <20260901-ti-am33-usb-v3-0-5e15c617d2e9@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBQFr0K6tqaUthRX3sO4KPRXvhEwLTQaw
 t2lGBPduJzkzbyZBPAIgRyymXiIGHDoVyh2GWla01+Aol2ZcMYV03lJR6SmKwo6hZoKKbTjIEs
 GjqzG3YPDx1Y7nd8cpvoKzZgSadFiGAf/3O5innafsv4px5wyqirTSFdx64Q8XjqDt30zdCSVI
 //j8uQqZ4WwSmkuvt1lWV6M8tOs9AAAAA==
X-Change-ID: 20260817-ti-am33-usb-4548f2e570ef
To: Vignesh Raghavendra <vigneshr@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andrzej Siewior <bigeasy@linutronix.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Ravi B <ravibabu@ti.com>, Kumar Gupta <ajay.gupta@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Bin Liu <b-liu@ti.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-omap@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788218595; l=2585;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=lhiU6/DDjvbnzvWKv8+M0o5FcxAg1VP+aI6rjwrIbvw=;
 b=pNNAoj+rP+n/nEWEzXEGqCUrp2oN6vGvO3dNkhf2xDdgx0FhG6t9HscKUjc8CMsqsvZqseUAt
 ks3qntcjLbWBADCMN/ZSv6/JducXplpgz4IXe9mqCtqFJbIYaJLl3tk
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

This patch series converts the legacy TI AM33xx, DM816, and DA8xx
USB/MUSB text bindings to modern DT schema.

The legacy am33xx-usb.txt and da8xx-usb.txt bindings was historically
structured as a single, monolithic file that documented the entire USB
subsystem (the wrapper, core MUSB controller, PHY, and control module)
all together. This series converts that monolithic text binding into
proper, distinct DT schema files for each hardware component.

Patches in this series:
1. dt-bindings: dma: ti,cppi41: Convert to DT schema
2. dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema
3. dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
4. dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema
5. dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
6. dt-bindings: usb: ti,da830-musb: Convert to DT schema

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v3:
- Dropped patch with dts change Fix redundant interrupts property in USB
  nodes.
- Rebased to latest mainline.
- Link to v2: https://lore.kernel.org/r/20260818-ti-am33-usb-v2-0-66fd44d66824@gmail.com

Changes in v2:
- patch 1: add interrupts as required property for am335x-cppi41
- patch 4,7: add pattern constraint for dma-names
- patch 6: remove deprecated property ti,hwmods from required
- Link to v1: https://lore.kernel.org/r/20260818-ti-am33-usb-v1-0-69ac5f92df45@gmail.com

---
Bhargav Joshi (6):
      dt-bindings: dma: ti,cppi41: Convert to DT schema
      dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema
      dt-bindings: usb: ti,musb-am33xx: Convert to DT schema
      dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema
      dt-bindings: usb: ti,am33xx-usb: Convert to DT schema
      dt-bindings: usb: ti,da830-musb: Convert to DT schema

 .../devicetree/bindings/dma/ti/ti,cppi41.yaml      | 109 +++++++++++
 .../devicetree/bindings/phy/ti,am335x-usb-phy.yaml |  49 +++++
 .../devicetree/bindings/usb/am33xx-usb.txt         | 200 ---------------------
 .../devicetree/bindings/usb/da8xx-usb.txt          |  81 ---------
 .../bindings/usb/ti,am335x-usb-ctrl-module.yaml    |  38 ++++
 .../devicetree/bindings/usb/ti,am33xx-usb.yaml     | 103 +++++++++++
 .../devicetree/bindings/usb/ti,da830-musb.yaml     | 113 ++++++++++++
 .../devicetree/bindings/usb/ti,musb-am33xx.yaml    | 113 ++++++++++++
 8 files changed, 525 insertions(+), 281 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260817-ti-am33-usb-4548f2e570ef

Best regards,
-- 
Bhargav

