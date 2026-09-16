Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DE4BB815
	for <dmaengine@vger.kernel.org>; Wed, 16 Sep 2026 22:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599168; cv=none; b=UfCNTzCilZujSTWinqKdGqbVHShVx9ZgHi2OZu0/Mmy5LnPpwC9JIznXZDAQYT3GfLsK3xoe4I7xXcsq19KayNeIZxJIDTs7PNMF8E/u9grYvFND329LlQyn3fiGaCtntkfF8zlPOSHNvqe+oOjNEUZGX5aDAbQ120xYJZbhRAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599168; c=relaxed/simple;
	bh=dW6PFmuMYshdo+Apio3A45km0bVQVqPMds+yE5PxQGE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SL0IXChrcp63NxjSSMpXYFJC4VBAS6aSoVjLfy4qUdmXbUq3jNc0XZkRMxVG3UoX5VvldaRrj/RK/QVuC+olwL5F/jUoauLHAAT6IVUpkPcG/n52sVtr2UIzX+ETaEUpOQad/kBMmqPqOWNV2/Obd26idd4QlCoictz5OnqbR9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhkyVqtp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhkyVqtp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3983C1F000FF;
	Wed, 16 Sep 2026 22:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789599161;
	bh=dW6PFmuMYshdo+Apio3A45km0bVQVqPMds+yE5PxQGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RhkyVqtpVQGs/5Ccz8fppqr5f+RYlGOgoLgTTrG0vYZMtnIllwE5cRU22vdv9TXfe
	 +bkfKZIbpjaJIvR/P6xYG3Gh+CGqha5eWv7smQmZaVbc1gWneqQK4Ni7x0hp7TixDk
	 DT8RuxlNYZwX/DzfPlpUcPHXvPmbTjGlfXfnmx9BIRk/FCBUzVVGaD/TrmCPgwgp6o
	 Rf2tUbyG5zAqD8ELD9qQ3re9kujBugN+m9ba7HKASCFFi6jbgIvUeCSVB72qQXbAZK
	 U4e3igxqDlZO9E0EIPmptfcbbakMzw0nlO4cuOFa+xMS+k8RVRqtl3/zRNYCYPbest
	 5dRroERpcYsmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCHv2] dmaengine: bestcomm: use platform machinery to get
 irq
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rosen Penev" <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260916224156.276511-1-rosenp@gmail.com>
References: <20260916224156.276511-1-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 22:52:40 +0000
Message-Id: <20260916225241.3983C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] misc: commit message and code mismatch regarding devm_platform_g=
et_and_ioremap_resource
--

commit e9aa0bc87e702e8cdbc8918ca965897d4edffc03
Author: Rosen Penev <rosenp@gmail.com>

dmaengine: bestcomm: use platform machinery to get irq

This commit updates the bestcomm driver to use platform_get_irq() for
interrupt mapping and replaces of_node references with platform_device. It
also removes the manual device tree node reference counting.

> Replace the open-coded resource lookup, request_mem_region, ioremap and
> the manual iounmap/release_mem_region cleanup in probe/remove with the
> managed devm_platform_get_and_ioremap_resource() helper. This removes the
> now-unused error-unmap/release paths and simplifies the driver.

[Severity: Medium]
Is this paragraph in the commit message accurate for this patch?

Looking at mpc52xx_bcom_probe() in drivers/dma/bestcomm/bestcomm.c around
line 374, the devm_platform_get_and_ioremap_resource() call already exists
prior to this patch (having been introduced in a prior commit,
0a8dda0a15d392).

Since this patch does not actually contain the changes described in this
paragraph, could the commit message be updated to only reflect the changes
introduced here?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916224156.2765=
11-1-rosenp@gmail.com?part=3D1
