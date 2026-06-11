Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE963FBA7
	for <dmaengine@vger.kernel.org>; Thu, 11 Jun 2026 08:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781165467; cv=none; b=rozaYqlPQyuGUjFCsGSM9Rj4Onzg7cfXZk6EpFEcSJDnZmIVlEFaFfLI1YL/N4jJx7xF4Ddmo7WaBzZYz8TNxBsvaxRNbnlgrGPd0hKBHM+gv8EsPG+/ku7Xs+CvWTn9RibD/AM8cH7eYpJ88TOUykD+sBCDx4Hos+npaadtxqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781165467; c=relaxed/simple;
	bh=MMR4uVxxwpYQMB1w+dgGURRBmfrk9b3XqHPUmvMLDFs=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ARPTABsj0CUkFYBOOLaQ7s+NubOSeDe8bp7lzrt/OOwrwt0sFirLGqT+Qf1OZXdkF2cF3bOg/RF6HqXGsEVcNILidBO9kQFXOzchbdnSKrJNycKuH+qvr17dHnc36OIjQ1YB8tILsGx9aX9RVfFnWmwAAHXfU+CBlacMv8x+va4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ns7N0ix7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ns7N0ix7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 863831F00893;
	Thu, 11 Jun 2026 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781165465;
	bh=MMR4uVxxwpYQMB1w+dgGURRBmfrk9b3XqHPUmvMLDFs=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=Ns7N0ix77EmQo+uRjkx4/oW4QoYNb4I/lz9ynvU5C1lleS6wrA7g3VwI02PPPD1yf
	 xQINXAD1eiL5XU+sqGFwJoX+o6Se57PgQqxZSST8+s9LUN72k9RSOW36YcUAzBlKDc
	 uZtZmhnTkX6VH8gvZ/Vjyt7XidEW439pJJPsplrqeV9+4DK3nBekbfOeUDmYc2Fk2J
	 2qKi7pJ4ykSFyBEt9AVZPPWgsR9Nc2ecFwlUE0HRWltYpvH9JCeUDCDBWVK4vhvp66
	 RpboVjAFIVgPYGBrjQwQjcAP2LAsxedJew3T5CJ3dcCLJC1YdFmWLPyta0Yb4PmjKk
	 wsJukqzWMtYTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dmaengine: hsu: Drop unused platform driver data
Reply-To: sashiko-reviews@lists.linux.dev
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org
In-Reply-To: <86a23025da12369034dc7444f43a7763f2e515fb.1781161455.git.ukleinek@kernel.org>
References: <86a23025da12369034dc7444f43a7763f2e515fb.1781161455.git.ukleinek@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 08:11:05 +0000
Message-Id: <20260611081105.863831F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message incorrectly states that it modifies struct pnp_d=
evice_id instead of struct pci_device_id.
--

commit 5cb66572eea17e218716d84ce22cd0b73ee38c30
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

dmaengine: hsu: Drop unused platform driver data

This patch drops the unused .driver_data assignments from the
hsu_pci_id_table array. It only modifies the source code representation
and does not affect the compiled output.

> The driver explicitly sets the .driver_data member of struct
> pnp_device_id to zero without relying on that value. Drop these unused
> assignments.

[Severity: Low]
This isn't a bug, but the commit message states that the driver sets the
member of struct pnp_device_id, while the patch actually modifies an
array of struct pci_device_id in drivers/dma/hsu/pci.c. Should the
commit message be updated to reference the correct struct?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781161455.gi=
t.ukleinek@kernel.org?part=3D1
