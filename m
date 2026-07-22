Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4956D47D952;
	Wed, 22 Jul 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735282; cv=none; b=MchaODFvRqm1OE6x+S4aHR20yTcr3vHG6zRW/1h27xAC4UuzF7aWf8g16iV3OFgaRCri78FXx9tLxf8Hn8gEh7BU6SagSopaIkBULNP6ITyykEVhtHE2E8Owrfy6TMLgL4D+b3jIiTQmDtW8G8qb2L4swVfgVfZKDH/sDZMiZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735282; c=relaxed/simple;
	bh=kyaaaakUpShPkZWfRPjFFPU45IrWTv47HGTaZf06lm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BkZ5haSvtVws+eqUjJbpS0lIfH8j3XrAf7LaJt95U2hUh0ITO/y4ClRgptBEAd0KyP+fbzNIu7CGYJq1F8aa10sIJ6H7rT3Z5eaVlsCrX1L9buRrFS8q0c6IDWB2BoG8Bh7+yiVHkvILZs54GEOBZCZeC12Vu6gjyJezeOB5VGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cms4hBxs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cms4hBxs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF215C19425;
	Wed, 22 Jul 2026 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784735281;
	bh=kyaaaakUpShPkZWfRPjFFPU45IrWTv47HGTaZf06lm8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Cms4hBxsToIxXqj9mt4GZ9Av0WMNvWQ6WK0+yqhyIwFC/W5IW4z0SxMYW1MWadNmi
	 JB59H4K8y+/8xoN9n/ToHNS/zk6UoScBt5dPzLlinm8tvXrDCfZrPE/VypBtR4+K2C
	 hqK+Awzj7f+GdtszoGeuyvCO/VJBv3EnYIax6T+B9IOc2U6GPS6s2fXD7UsMpGyz8S
	 YVQsFUL3b4aXFit9z4ntnMwGspTqLYezxQb/Fi6gRYQy3ENZXnItdi3cS6vQUymo/P
	 OE3HnOXUPSixspSn/WMHiMx+vk4hqCbzcYyTkkrSE3j1h9UUeDAsi2R7k+XFqPaudE
	 O9KgC3zXHJ2Ig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FF2C44532;
	Wed, 22 Jul 2026 15:48:01 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathan.lynch.amd.com@kernel.org>
Subject: [PATCH 0/4] dmatest: shared channel fixes and fatal errors option
Date: Wed, 22 Jul 2026 10:47:45 -0500
Message-Id: <20260722-dmatest-fixes-and-fatal-errors-v1-0-8287709987ea@amd.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAxA0V8ZeTYwW7Yxf0V8SNvMZWgnSRVh7
 N+t+njgcjcwVmGDU7OB8ktM1lxxPDQQZ8pXRknV4FrXt4NzmO5U2ApO8mZDygknKnRDVl3V0Af
 fdz51FMcAdfJQ/pX1cb78bc+wcCzfK+z7B05BKKyCAAAA
X-Change-ID: 20260722-dmatest-fixes-and-fatal-errors-3b3653d5ac9b
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Tycho Andersen <tycho@kernel.org>, Wei Huang <wei.huang2@amd.com>, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Lynch <nathan.lynch@amd.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784735280; l=1398;
 i=nathan.lynch@amd.com; s=20260722; h=from:subject:message-id;
 bh=kyaaaakUpShPkZWfRPjFFPU45IrWTv47HGTaZf06lm8=;
 b=PR5pN2DYYDdVLf9wJmMeYjggJ89HQBjh4PJxNZurDXOt2MDpTN0p91cnDRN8nBP1GH+zNoHI9
 l/v1GDTin0UBxVtV8Jf8hzmn6ZsKVowli2JnkqvaOY57t2KpT5Vhxg8
X-Developer-Key: i=nathan.lynch@amd.com; a=ed25519;
 pk=pO5+BCw/TENGLvwX5NYZOZmZihcxjkxeFSMuk47erps=
X-Endpoint-Received: by B4 Relay for nathan.lynch@amd.com/20260722 with
 auth_id=891
X-Original-From: Nathan Lynch <nathan.lynch@amd.com>
Reply-To: nathan.lynch@amd.com

Sending several fixes for issues in dmatest that arise when running
multiple threads per channel. I have encountered these issues while
testing the sdxi driver.

Patch 1 "Don't forcibly terminate channel in polled mode" is a resend of a
fix I sent a while back that didn't get picked up. [1]

Also included is a feature introducing a "fatal errors" parameter that
provides the option of panicking the kernel after a given number of errors
have occurred in a run.

Claude Code w/Opus 4.8 was used to investigate the problems fixed by
patches 2 and 3, and it assisted in writing the changes in patch 2-4.

[1] https://lore.kernel.org/dmaengine/20250408-dmaengine-dmatest-poll-mode-fix-v1-1-754a446a5363@amd.com/

Signed-off-by: Nathan Lynch <nathan.lynch@amd.com>
---
Nathan Lynch (4):
      dmaengine: dmatest: Don't forcibly terminate channel in polled mode
      dmaengine: dmatest: Suppress bogus failures when stopping a run
      dmaengine: dmatest: Terminate channel before freeing threads
      dmaengine: dmatest: Optionally make test errors fatal

 drivers/dma/dmatest.c | 67 ++++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 11 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260722-dmatest-fixes-and-fatal-errors-3b3653d5ac9b

Best regards,
--  
Nathan Lynch <nathan.lynch@amd.com>


