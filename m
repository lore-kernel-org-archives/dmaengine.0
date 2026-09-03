Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BEA41D107;
	Thu,  3 Sep 2026 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455062; cv=none; b=JeADe1wMIvTNSahShq+pzij8aFL2nZYmJLwcr6cumF7SHSkSOnSwrWYMtnIGOguOpHubfM5kFINR3r0uduHqaMnNY57JvoS7X6BjpgGHpHKTAmtX3OxlaPzEeIAkahQxGG4oHLkgUVOE4C+WvscVge8vI4golrETghnTAwIeYbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455062; c=relaxed/simple;
	bh=P2kh42sz3F/S3MGz/OO66I7pRINdwtyckW3evH0s9xw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UXF3Y2/OhiKfteX/WkSg9W89s8pBlM94lLK+wn+QX8JAJ6g9SWhwBtmsZEDdufkzYtFNIJr8CX3n1M4iIB7OE/9zzi+4BHk8dqDaCZqfZEvWIVLbF4GaLwFkGB5C6lXgzdogd/iUA9QpaaOx3RTUKw+E5Nc+uCwwJz9Is7NgAYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dls2N2dw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dls2N2dw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AF81F000E9;
	Thu,  3 Sep 2026 17:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455060;
	bh=EurD4w8b/UeMVamu+ReBim1+YAXqPm5dzgrxosZd9fM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dls2N2dw02Iv9r7slmak7JJSJHHeVsGc6meB9X+drKBFDZDxb5XeK3n0bAqCJmTHN
	 n268+axM18t2+TdjokhvMhMbTRfwg2mW1Yuek5idHD2QexLhzLjQQeKufgq+mz5RbH
	 sGoKh23FFx/alQ3XOVw8G7rx+6lCYqribNF3ZPciTxAYf2Bxtd/8E6DJTjTDNQvHWM
	 uuW1tNAfdIBL2wFL2S7iPZyh73gL3f13TbLcclNcUVT/XkM6j9SQwOXLfXqNjyg/Ik
	 XfYF3iNWHTc2AepcxOhdCl3VXkOBOaAOcjZkdc3QJCdXYwzWTnhvMFZu+B1CKVNBCT
	 R6bJhCnnPxeig==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Manuel Ebner <manuelebnerli@mailbox.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260903095545.729607-3-manuelebnerli@mailbox.org>
References: <20260903095545.729607-3-manuelebnerli@mailbox.org>
Subject: Re: [PATCH] docs: dmaengine: Fix bracket
Message-Id: <178845505816.1711546.8996027018854474819.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:18 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 03 Sep 2026 11:55:45 +0200, Manuel Ebner wrote:
> Add missing ')' to sentence.
> 
> 

Applied, thanks!

[1/1] docs: dmaengine: Fix bracket
      commit: 635e425c0771ec2ba09b0ef69bb9814e2554374e

Best regards,
-- 
~Vinod


