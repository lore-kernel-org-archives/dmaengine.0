Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D142459EA
	for <dmaengine@vger.kernel.org>; Wed, 23 Sep 2026 04:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790137000; cv=none; b=JFzAJDgN64BtST5R5rLaVgAQSywo0SGfxJTkHpjrNY20iKfZsETcZpC9aba2bxREgYwsDWjvxheqDf4RE6zUI0BLpAt/BZhUaprXoNvvTzHG/qJlwwrBuvPUyOqx+u7JGSzu1f4vWIqhSYFfqs+Y1yKoZIab/sUSITFACE9Pu7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790137000; c=relaxed/simple;
	bh=ZZx4X1YYGYC8rDTrXiFjkXhKd42hfdC/KtH31C7Eqbg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YdbjT9Fy4XcWhLDsutZRvZYDco9YjzokOqvGDfsV8x8nAzFgREue+zJp67g4H7SK/ltqE2N6X5RI0Wi8YzInvXwDXeiuuIFx+RF8DFxjwQOwDIo50Alhl5v47zHJsSV6G7XQa3gfp1oqqmOk0CmGgLk+peRUEs++Pwphevqjs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMDextzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMDextzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF301F000FF;
	Wed, 23 Sep 2026 04:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790136999;
	bh=LDqMJomP1qHta1IPaDclS+8nh3pysbCI9DsXoYXnSeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fMDextzMADqEnQmNYc/akZMlh1kS/Q4TQhBAIyLsLg5XzktCoTmBXRAapRP03s4eN
	 hf1oMOcIXEZeQm3jGZHOCFiNnJpzRNEDlNB/x751+ywjhsLUt5XG8e7Q2DUG2Ob+FG
	 rRVSFL60cwZgnXdcQe1GNvKN6nPNfi9LfMsh26AexGcxBabGRz8Iq2vBa0Fnf4ZAdf
	 zt82BRVtS+A+ez6sx8Yq2SPlYm8yi2yCXhugIKbGdLJ/Sroxj4RqVeelaS71mxDnwp
	 0SNWT74cjcweZ/jcmb+kyNVdXY48G1B0Z6feP/V8u77lH9Z8jPFaEu5++8LdZP8EB3
	 CyrjjkeMl0sZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dmaengine: ti: edma: fix pm_runtime usage counter
 leak on error
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260923040831.10936-1-phucduc.bui@gmail.com>
References: <20260923040831.10936-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 04:16:38 +0000
Message-Id: <20260923041639.1EF301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dmaengine: commit message wrongly references netcp_probe()
--

commit 46b6daf75a4d492c8e72053cb40b58c95d74f2fd
Author: bui duc phuc <phucduc.bui@gmail.com>

dmaengine: ti: edma: fix pm_runtime usage counter leak on error

This commit replaces pm_runtime_get_sync() with pm_runtime_resume_and_get()
to prevent leaking a runtime PM usage counter reference on error paths.

>     pm_runtime_get_sync() leaves the runtime PM usage counter incremented=
 even
>     when it fails, but the error path in netcp_probe() does not call
>     pm_runtime_put_noidle() to balance it, leaking a reference each time
>     resume fails.

[Severity: Medium]
The commit message references netcp_probe(), but the patch actually modifies
edma_probe() in drivers/dma/ti/edma.c. Could the commit message be updated =
to
reflect the correct function name being patched?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923040831.1093=
6-1-phucduc.bui@gmail.com?part=3D1
