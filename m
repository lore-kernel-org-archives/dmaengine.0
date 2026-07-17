Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D553D9544;
	Fri, 17 Jul 2026 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784291753; cv=none; b=DQ1Y/D/rBNC4nkxdaJZC6FVfWRN5fyI5kxoRslQQaayoqw5FEKwENGm7tSQhLL//dP9UR1gqVe81I5on1kqoTa0mSO4jnTSUk0Wy5uf3zBqr6YQAtrOUrpXFmLWaiiwUe+DuyUu3Fbu8kRgs/G16GUA+nQsjQFbpbqogPPWadL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784291753; c=relaxed/simple;
	bh=P72Z9bIXJfVckol6bHoLj78Yz22a5AOm/JIBiUV7JxQ=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DwvgWHCm+6sbvr62GZwTsC34rJWlmMFg/MGeMy3Bn1nrDgTr8/Dx4J2FLq2kXw3d3/x9lfXykoEGBY8QsOhy323t5YUaLIWx0uUk1lHiGn3uceMu2sej7Ou43ke84Hi/COn0ej6feYbOsAbqFD2unKe0zcrIu0NixEqP9LEysSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNpg8Mgo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNpg8Mgo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523951F00A3A;
	Fri, 17 Jul 2026 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784291747;
	bh=95GIP0c1PLs6EM+Pu8e6TBp3VvXHOZv0VJMsjAqvdic=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=TNpg8MgowM5cWLpZ68stDj+6M6swARPaQ0lSCCyVclk2H3Py/V1hnL/mI5ABLJmh9
	 LfOezgWlvItoc6nM/niH9xbiUmH/qh1QUh44qS37QcXGuPM8dXf4QqaF2sbLQXezN6
	 i/zFua6F3bRn7IRn2f194sGP17/joLlErP7gH+RFWBgZsRnx/pUqBFZxgt9ehhRlaX
	 hqg5mWOoJhfNt/7St1T8OVSX4HJjeED4/enDRo8q1LHRAeuqzz3S2IyntKC34s0VQQ
	 U3Na7m0gmliXfE59rb5pgIDhDISUAQP29VwsYesQUQ4DCUeGRE5W0rz84p5FKiwrIC
	 FswxfkT/jCHxg==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
In-Reply-To: <20260716052758.23465-1-phucduc.bui@gmail.com>
References: <20260716052758.23465-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH] dmaengine: validate dev and name in dma_request_chan()
Message-Id: <178429174594.1176696.13915537220648896398.b4-ty@kernel.org>
Date: Fri, 17 Jul 2026 18:05:45 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 16 Jul 2026 12:27:58 +0700, phucduc.bui@gmail.com wrote:
> dma_request_chan() assumes both @dev and @name are valid, but neither is
> checked before use.
> 
> dev is dereferenced immediately via dev_fwnode(), which accesses
> dev->of_node or dev->fwnode without checking for NULL. Likewise, if name is
> NULL and the OF/ACPI lookup does not succeed, the legacy filter-map path
> eventually passes it to strcmp(), resulting in a NULL pointer dereference.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: validate dev and name in dma_request_chan()
      commit: dc8a5238e1c7db74a7b4f02bcf0b05559b6627c5

Best regards,
-- 
~Vinod


